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
                    Image(systemName: "t.circle.fill")
                    Text("Tokyo")
                }.tag(1)
            NakayamaTabView()
                .tabItem{
                    Image(systemName: "n.circle.fill")
                    Text("Nakayama")
                }.tag(2)
            HanshinTabView()
                .tabItem{
                    Image(systemName: "h.circle.fill")
                    Text("Hanshin")
                }.tag(3)
            FortuneView()
                .tabItem{
                    Image(systemName: "l.circle.fill")
                    Text("Lucky")
                }.tag(4)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
