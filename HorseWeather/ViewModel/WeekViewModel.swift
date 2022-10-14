//
//  WeekViewModel.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/10/07.
//

import Foundation
import SwiftUI

//var currentDate = Date()


class WeekViewModel: ObservableObject {
    @Published var weekDay = getWeekDay()
    @Published var weekNext = getWeekNext()
    
    init(weekDay: String = getWeekDay(), weekNext: [String] = getWeekNext()) {
        self.weekDay = weekDay
        self.weekNext = weekNext
    }
}

func getWeekDay() -> String {

    // 西暦カレンダー（gregorian）生成
    var calendar = Calendar(identifier: .gregorian)

    // カレンダーのlocaleを「日本語、日本地域」に設定
    calendar.locale = Locale(identifier: "ja_JP")

    let currentDate = Date()

    //weekDayに１〜７が入る 今日の数字が入っている
    let weekDay = Calendar.current.component(.weekday, from: currentDate)

    //calender.weekdaysymbolsに[日曜日,月曜日,火曜日,...]が入っている
    let today = Calendar.current.shortWeekdaySymbols[weekDay-1]

    return today
}


func getWeekNext() -> [String] {
    // 西暦カレンダー（gregorian）生成
    var calendar = Calendar(identifier: .gregorian)

    // カレンダーのlocaleを「日本語、日本地域」に設定
    calendar.locale = Locale(identifier: "ja_JP")

    let currentDate = Date()

    //weekDayに１〜７が入る 今日の数字が入っている
    var weekDay = Calendar.current.component(.weekday, from: currentDate)

    //明日の曜日から６つ曜日が取得できる配列を作りたい
    var weekDays = [String]()

    for _ in 1...6 {
        weekDay += 1
        //2〜8が入る
        if 2 <= weekDay && weekDay <= 7 {
            weekDays.append(calendar.shortWeekdaySymbols[weekDay-1])
        } else {
            weekDay -= 7
            weekDays.append(calendar.shortWeekdaySymbols[weekDay-1])
        }
    }

    //calender.weekdaysymbolsに[日曜日,月曜日,火曜日,...]が入っている
//    _ = calendar.weekdaySymbols[weekDay-1]

    return weekDays
}

