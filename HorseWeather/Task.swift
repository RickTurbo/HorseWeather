//
//  Task.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/11.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}
