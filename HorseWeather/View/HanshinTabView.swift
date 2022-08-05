//
//  HanshinTabView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/07/11.
//

import SDWebImageSwiftUI
import SwiftUI

struct HanshinTabView: View {
    @StateObject var viewModel = HanshinViewModel()
    
    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("weather5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)

            VStack {
                ScrollView {
                    LazyVStack {
                        Text("阪神競馬場")
                            .font(.custom("KouzanBrushFontOTF",size: 60))
                            .padding(.top, 60)

        //                WebImage(url: viewModel.weatherIconURL)
        //                    .resizable()
        //                    .frame(width: 150, height: 130)

                        Text(viewModel.title)
                            .font(.custom("KouzanBrushFontOTF", size: 60))
                            .padding(.top, 15)

                        Text(viewModel.weatherIcon)
                            .font(.system(size:90))

                        Text(viewModel.descriptionText)
                            .font(.custom("KouzanBrushFontOTF",size: 60))
                            .padding(.top, 5)

                        Text(viewModel.temp)
                            .font(.custom("Selima", size: 80))
                            .padding(.top, 5)

                        Text("１時間ごとの天気")
                            .font(.custom("KouzanBrushFontOTF",size: 40))
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
                        .padding(.bottom, 50)
                    }
                }

            }
        }
    }
}

struct HanshinTabView_Previews: PreviewProvider {
    static var previews: some View {
        HanshinTabView()
    }
}
