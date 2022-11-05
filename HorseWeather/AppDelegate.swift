//
//  AppDelegate.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/11/04.
//

import Foundation
import GoogleMobileAds
import AdSupport
import AppTrackingTransparency

class AppDelegate: NSObject, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

        if #available(iOS 14, *) {
            //許可をもらう処理
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in
                GADMobileAds.sharedInstance().start(completionHandler: nil)
            })
        } else {
            //iOS14.0以前の場合
            GADMobileAds.sharedInstance().start(completionHandler: nil)
        }

        //別の処理

        return true
    }
}
