//
//  NakayamaViewModel.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/18.
//

import Foundation
import SwiftUI

private let defaultIcon = "❓"
private let iconMap = [
    "Drizzle" : "🌧",
    "Thunderstorm" : "⛈",
    "Rain": "🌧",
    "Snow": "❄️",
    "Clear": "☀️",
    "Clouds" : "☁️",
    "Mist" : "🐴"
]

class NakayamaViewModel: ObservableObject {
    @Published var title: String = "-"
    @Published var descriptionText: String = "-"
    @Published var temp: String = "-"
    @Published var timezone: String = "-"
    @Published var icon: String = "_"
    @Published var date: String = "_"
    @Published var hourly = [HourWeather]()
    @Published var weatherIcon: String = defaultIcon
    @Published var weatherIcon2 = [String]()
    @Published var pop = [String]()
    @Published var temp2 = [String]()

    init() {
        fetchWeather()
    }

    var weatherIconURL: URL {
        let urlString = "https://openweathermap.org/img/wn/\(icon)@2x.png"
        return URL(string: urlString)!
    }

    func fetchWeather() {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=35.5325868&lon=139.5689054&units=metric&lang=ja&appid=563f1813695628294ea2117b80ed8826") else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil else {
                return
            }

            do {
                let model = try JSONDecoder().decode(WeatherModel.self, from: data)
                DispatchQueue.main.async {
                    self.title = model.current.weather.first?.main ?? "No Title"
                    self.descriptionText = model.current.weather.first?.description ?? "No Description"
                    //                    self.temp = "\(model.current.temp)°"
                    let temp = model.current.temp
                    let roundTemp = round(temp)
                    let intTemp = Int(roundTemp)
                    self.temp = "\(intTemp)°"
                    self.timezone = model.timezone
                    self.icon = model.current.weather.first?.icon ?? "No icon"
                    self.date = "\(model.current.dt)"

                    self.weatherIcon = iconMap[model.current.weather.first?.main ?? defaultIcon] ?? defaultIcon
                    self.weatherIcon2.append(contentsOf: [iconMap[model.hourly[0].weather.first?.main ?? defaultIcon]! ,iconMap[model.hourly[1].weather.first?.main ?? defaultIcon]!,iconMap[model.hourly[2].weather.first?.main ?? defaultIcon]!])
                    self.weatherIcon2.append(contentsOf: [iconMap[model.hourly[3].weather.first?.main ?? defaultIcon]!,iconMap[model.hourly[4].weather.first?.main ?? defaultIcon]!])

                    self.pop.append(contentsOf: ["\(model.hourly[0].pop)%","\(model.hourly[1].pop)%","\(model.hourly[2].pop)%","\(model.hourly[3].pop)%","\(model.hourly[4].pop)%",])

                    self.temp2.append(contentsOf: ["\(model.hourly[0].temp)°","\(model.hourly[1].temp)°","\(model.hourly[2].temp)°","\(model.hourly[3].temp)°","\(model.hourly[4].temp)°",])
                }
            }
            catch {
                print("failed")
            }
        }
        task.resume()
    }
}
