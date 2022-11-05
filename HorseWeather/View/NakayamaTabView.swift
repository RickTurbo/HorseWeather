//
//  NakayamaTabView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//

import SDWebImageSwiftUI
import SwiftUI

struct NakayamaTabView: View {
    @StateObject var viewModel = NakayamaViewModel()
    @StateObject var weekModel = WeekViewModel()
    
    let AdMobID: String = "ca-app-pub-7803037430770004/1199493184"
    
    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("weather4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)

            VStack {
                Image("MeikeiYell2")
                    .resizable()
                    .frame(width: 100, height: 70)
                    .cornerRadius(20)
                    .offset(x: 140, y: -20)

                Image("Contrail2")
                    .resizable()
                    .frame(width: 120, height: 80)
                    .cornerRadius(20)
                    .offset(x: -130, y: 80)
            }
            
            VStack {
                ScrollView {
                    LazyVStack {
                        Text("中山競馬場")
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

struct NakayamaTabView_Previews: PreviewProvider {
    static var previews: some View {
        NakayamaTabView()
    }
}
