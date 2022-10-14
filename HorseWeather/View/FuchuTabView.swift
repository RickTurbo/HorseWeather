//
//  FuchuTabView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//

import SDWebImageSwiftUI
import SwiftUI

struct FuchuTabView: View {
    @StateObject var viewModel = WeatherViewModel()
    @StateObject var weekModel = WeekViewModel()

    let AdMobID: String = "ca-app-pub-7803037430770004/1473442469"

    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("weather3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)

            VStack {
                Image("Jackdol2")
                    .resizable()
                    .frame(width: 120, height: 80)
                    .cornerRadius(20)
                    .offset(x: -130, y: 60)

                Image("Onyankopon2")
                    .resizable()
                    .frame(width: 140, height: 100)
                    .cornerRadius(20)
                    .offset(x: 130, y: 80)
            }
            
            VStack {
                ScrollView {
                    LazyVStack {
                        Group {
                            Text("東京競馬場")
                                .font(.custom("KouzanBrushFontOTF",size: 45))
                                .padding(.top, 50)

                            Text(viewModel.title)
                                .font(.custom("KouzanBrushFontOTF", size: 45))
                                .padding(.top, 15)

                            Text(viewModel.weatherIcon)
                                .font(.system(size:80))
                                .padding(.bottom, 10)

                            Text(viewModel.descriptionText)
                                .font(.custom("KouzanBrushFontOTF",size: 40))

                            Text(viewModel.temp)
                                .font(.custom("Selima", size: 60))
                                .padding(.top, 5)

                            Text("１時間ごとの天気")
                                .font(.custom("KouzanBrushFontOTF",size: 25))
                                .padding(.top, 50)
                        }

                        ScrollView(.horizontal) {
                            LazyHStack {
                                ForEach(viewModel.weatherIcon2.indices, id: \.self) { index in
                                    let time = index + 1
                                    VStack{
                                        Text("\(time)時間後")
                                            .font(.custom("KouzanBrushFontOTF",size: 20))

                                        Text(viewModel.weatherIcon2[index])
                                            .font(.system(size:50))
                                    }
                                    .frame(maxWidth: 90, maxHeight: 100)
                                    .padding()
                                }
                            }
                            .padding()
                        }

                        Text("１週間ごとの天気")
                            .font(.custom("KouzanBrushFontOTF",size: 25))
                            .padding(.top, 20)

                        ScrollView(.horizontal) {
                            LazyHStack {
                                VStack {
                                    Text("今日")
                                        .font(.custom("KouzanBrushFontOTF",size: 25))
                                    Text(viewModel.todayIcon)
                                        .font(.system(size:37))
                                }
                                .offset(x:0, y:22)

                                HStack {
                                    ForEach(weekModel.weekNext, id: \.self) { week in
                                        Text(week).frame(width: 40)
                                            .font(.custom("KouzanBrushFontOTF",size: 25))
                                    }
                                }

                            }
                            HStack {
                                ForEach(viewModel.dailyIcon.indices, id: \.self) { index in
                                    VStack{
                                        Text(viewModel.dailyIcon[index])
                                            .font(.system(size:37))
                                    }
                                }
                            }
                            .offset(x:30, y:-40)
                        }
                        .offset(x:30, y:0)

                        BannerAd(unitID: AdMobID)
                            .frame(width: UIScreen.main.bounds.width, height: 50)
                    }
                    .padding(.bottom, 50)
                }
            }
        }
    }
}

struct FuchuTabView_Previews: PreviewProvider {
    static var previews: some View {
        FuchuTabView()
    }
}




////1週間の天気
//ScrollView(.horizontal) {
//    LazyHStack {
//        Text("今日").frame(width: 50, height: 50, alignment: .center)
//        ForEach(weekModel.weekNext, id: \.self) { week in
//            VStack {
//                Text(week).frame(width: 50, height: 50, alignment: .center)
//            }
//            .padding()
//        }
//    }
//    .padding()
//}



//ScrollView(.horizontal) {
//    HStack {
//        ForEach(viewModel.dailyIcon.indices, id: \.self) { index in
//            VStack{
//                Text(weekModel.weekNext[0])
//                    .font(.custom("KouzanBrushFontOTF",size: 20))
//                Text(viewModel.dailyIcon[index])
//                    .font(.system(size:50))
//            }
//            .frame(maxWidth: 90, maxHeight: 300)
//            .padding()
//        }
//    }
//    .padding()
//}
