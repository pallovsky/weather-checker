//
//  ContentView.swift
//  weather-checker
//
//  Created by Guest User on 15/11/2022.
//

import SwiftUI

struct DailyView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()

    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 10) {
                NavigationLink(destination: WeeklyView()) {
                    Text("Weekly weather")
                }
                Spacer()
                if let currentWeather = weatherAPIClient.currentWeather  {
                    HStack(alignment: .center, spacing: 16) {
                        currentWeather.weatherCode.image
                            .font(.largeTitle)
                        Text("\(currentWeather.temperature)º")
                            .font(.largeTitle)
                    }
                    Text(currentWeather.weatherCode.description)
                        .font(.body)
                        .multilineTextAlignment(.center)
                } else {
                    Text("No weather info available yet.\nTap on refresh to fetch new data.\nMake sure you have enabled location permissions for the app.")
                        .font(.body)
                        .multilineTextAlignment(.center)
                    Button("Refresh", action: {
                        Task {
                            await weatherAPIClient.fetchWeather()
                        }
                    })
                }
                Spacer()
            }
            .onAppear {
                Task {
                    await weatherAPIClient.fetchWeather()
                }
            }
        }
    }
}

struct DailyView_Previews: PreviewProvider {
    static var previews: some View {
        DailyView()
    }
}
