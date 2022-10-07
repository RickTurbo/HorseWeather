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
    let AdMobID: String = "ca-app-pub-3940256099942544/2934735716"
    
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
                    .frame(width: 120, height: 80)
                    .cornerRadius(20)
                    .offset(x: 140, y: -20)

                Image("Contrail2")
                    .resizable()
                    .frame(width: 140, height: 100)
                    .cornerRadius(20)
                    .offset(x: -130, y: 80)
            }
            
            VStack {
                ScrollView {
                    LazyVStack {
                        Text("中山競馬場")
                            .font(.custom("KouzanBrushFontOTF",size: 50))
                            .padding(.top, 50)
                        //                WebImage(url: viewModel.weatherIconURL)
                        //                    .resizable()
                        //                    .frame(width: 150, height: 130)
                        Text(viewModel.title)
                            .font(.custom("KouzanBrushFontOTF", size: 50))
                            .padding(.top, 15)

                        Text(viewModel.weatherIcon)
                            .font(.system(size:90))
                            .padding(.bottom, 10)

                        Text(viewModel.descriptionText)
                            .font(.custom("KouzanBrushFontOTF",size: 50))

                        Text(viewModel.temp)
                            .font(.custom("Selima", size: 60))
                            .padding(.top, 5)

                        Text("１時間ごとの天気")
                            .font(.custom("KouzanBrushFontOTF",size: 30))
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
                                        //                                Text(viewModel.pop[index])
                                        //                                    .foregroundColor(.blue)
                                        //                                Text(viewModel.temp2[index])
                                    }
                                    .frame(maxWidth: 90, maxHeight: 100)
                                    .padding()
                                }
                            }
                            .padding()
                        }
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
