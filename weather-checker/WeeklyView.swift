//
//  WeeklyView.swift
//  weather-checker
//
//  Created by Macha Rain on 14/01/2023.
//

import Foundation
import SwiftUI



struct WeeklyView: View {
    @StateObject private var weatherAPIClient = WeatherAPIClient()
    
    let date = Date()
    let dateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            Spacer()
            if let weeklyWeather = weatherAPIClient.weeklyWeather {
                List() {
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: date))
                            .foregroundColor(.blue)
                        weeklyWeather[0].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[0].temperature)º")
                        Text("\(weeklyWeather[0].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 1, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[1].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[1].temperature)º")
                        Text("\(weeklyWeather[1].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 2, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[2].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[2].temperature)º")
                        Text("\(weeklyWeather[2].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 3, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[3].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[3].temperature)º")
                        Text("\(weeklyWeather[3].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 4, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[4].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[4].temperature)º")
                        Text("\(weeklyWeather[4].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 5, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[5].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[5].temperature)º")
                        Text("\(weeklyWeather[5].weatherCode.shortDescription)")
                    }
                    HStack(alignment: .center, spacing: 16) {
                        Text(dateFormatter.string(from: Calendar.current.date(byAdding: .day, value: 6, to: date)!))
                            .foregroundColor(.blue)
                        weeklyWeather[6].weatherCode.image
                            .resizable()
                            .font(.largeTitle)
                            .frame(width: 40, height: 30)
                        Text("\(weeklyWeather[6].temperature)º")
                        Text("\(weeklyWeather[6].weatherCode.shortDescription)")
                    }
                }
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
        }.onAppear {
            Task {
                await weatherAPIClient.fetchWeeklyWeather()
            }
        }
    }
}

struct WeeklyView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyView()
    }
}
