//
//  HorseWeatherApp.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//

import SwiftUI
import GoogleMobileAds

@main
struct HorseWeatherApp: App {
    init() {
        GADMobileAds.sharedInstance().start(completionHandler: nil)
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
