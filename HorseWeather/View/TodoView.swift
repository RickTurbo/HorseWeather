//
//  TodoView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/11.
//

import SwiftUI

struct TodoView: View {
    @StateObject var realmManager = RealmManager()
    @State private var showAddTaskView = false
    let AdMobID: String = "ca-app-pub-7803037430770004/1473442469"

    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realmManager)

            SmallAddButton()
                .padding()
                .onTapGesture {
                    showAddTaskView.toggle()
                }
        }
        .sheet(isPresented: $showAddTaskView) {
            AddTaskView()
                .environmentObject(realmManager)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .bottom)
        .background(Color(hue: 0.535, saturation: 0.255, brightness: 0.893))
    }
}

struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
