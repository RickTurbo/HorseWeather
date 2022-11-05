//
//  ContentView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//


import SwiftUI
import AppTrackingTransparency

struct ContentView: View {
    @State var selectedTag = 1
    let AdMobID: String = "ca-app-pub-7803037430770004/6883172502"
    
    var body: some View {
        VStack {
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
                TodoView()
                    .tabItem{
                        Image(systemName: "m.circle.fill")
                        Text("Memo")
                    }.tag(4)
                FortuneView()
                    .tabItem{
                        Image(systemName: "l.circle.fill")
                        Text("Lucky")
                    }.tag(5)
            }
            BannerAd(unitID: AdMobID)
                .frame(width: UIScreen.main.bounds.width, height: 50)
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.didBecomeActiveNotification)) { _ in
            ATTrackingManager.requestTrackingAuthorization(completionHandler: { status in })
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
