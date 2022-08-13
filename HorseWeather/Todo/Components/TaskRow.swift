//
//  TaskRow.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/08.
//

import SwiftUI

struct TaskRow: View {
    var task: String
    var completed: Bool

    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ? "checkmark.circle" : "circle")

            Text(task)
        }
    }
}

struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: "エフフォーリアは不安要素もあるが買うべき", completed: true)
    }
}
