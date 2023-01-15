//
//  WeatherAPIClient.swift
//  weather-checker
//
//  Created by Guest User on 15/11/2022.
//

import Foundation
import CoreLocation
import SwiftUI

final class WeatherAPIClient: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentWeather: Weather?
    @Published var weeklyWeather: [Weather]?
    @Published var currentLocation: CLLocation?
    
    private let apiToken = "CGuV3hvxwEIrWONxS7h1h4VAvSYwYkkI"
    private let locationManager = CLLocationManager()
    private let dateFormatter = ISO8601DateFormatter()
    
    override init() {
        super.init()
        locationManager.delegate = self
        requestLocation()
    }

    func fetchWeather() async {
        guard let location = locationManager.location else {
            requestLocation()
            return
        }
        
        if self.currentLocation == nil {
            DispatchQueue.main.async { [weak self] in
                self?.currentLocation = location
            }
        }
        
        guard let url = getApiUrlForDate(date: Date(), location: location) else {
            return
        }

        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let weatherResponse = try? JSONDecoder().decode(WeatherModel.self, from: data),
               let weatherValue = weatherResponse.data.timelines.first?.intervals.first?.values,
               let weatherCode = WeatherCode(rawValue: "\(weatherValue.weatherCode)") {
                DispatchQueue.main.async { [weak self] in
                    self?.currentWeather = Weather(temperature: Int(weatherValue.temperature),
                                                   weatherCode: weatherCode)
                }
            }
        } catch {
            // handle the error
        }
    }
    
    func fetchWeeklyWeather() async {
        guard let location = locationManager.location else {
            requestLocation()
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            self?.currentLocation = location
        }
        
        guard let url = URL(string: "https://api.tomorrow.io/v4/timelines?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&fields=temperature&fields=weatherCode&units=metric&timesteps=1d&startTime=\(dateFormatter.string(from: Date()))&endTime=\(dateFormatter.string(from: Date().addingTimeInterval(60 * 60 * 24 * 6)))&apikey=\(apiToken)") else {
                   return
            }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let weatherResponse = try? JSONDecoder().decode(WeatherModel.self, from: data),
               let weatherValues = weatherResponse.data.timelines.first?.intervals.map({ $0.values }) {
                DispatchQueue.main.async { [weak self] in
                    self?.weeklyWeather = weatherValues.map({
                        Weather(temperature: Int($0.temperature), weatherCode: WeatherCode(rawValue: "\($0.weatherCode)")!)
                    })
                }
            }
        }
        catch {
            // handle the error
        }
    }
    
    private func getApiUrlForDate(date: Date, location: CLLocation) -> URL? {
        return URL(string: "https://api.tomorrow.io/v4/timelines?location=\(location.coordinate.latitude),\(location.coordinate.longitude)&fields=temperature&fields=weatherCode&units=metric&timesteps=1h&startTime=\(dateFormatter.string(from: date))&endTime=\(dateFormatter.string(from: date.addingTimeInterval(60 * 60)))&apikey=\(apiToken)")
    }
    
    private func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        Task { await fetchWeather() }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // handle the error
    }
}
