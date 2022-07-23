//
//  ContentView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @State var selectedTag = 1

    var body: some View {
        TabView(selection: $selectedTag) {
            FuchuTabView()
                .tabItem{
                    Image(systemName: "die.face.1")
                    Text("Tokyo")
                }.tag(1)
            NakayamaTabView()
                .tabItem{
                    Image(systemName: "die.face.2")
                    Text("Nakayama")
                }.tag(2)
            HanshinTabView()
                .tabItem{
                    Image(systemName: "die.face.3")
                    Text("Hanshin")
                }.tag(3)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
