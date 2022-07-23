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
    
    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("horse3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)
            
            VStack {
                Text("中山競馬場")
                    .font(.custom("KouzanBrushFontOTF",size: 60))
                    .padding(.top)
                
//                WebImage(url: viewModel.weatherIconURL)
//                    .resizable()
//                    .frame(width: 150, height: 130)

                Text(viewModel.weatherIcon)
                    .font(.system(size:90))

                Text(viewModel.title)
                    .font(.custom("Selima", size: 60))

                Text(viewModel.descriptionText)
                    .font(.custom("KouzanBrushFontOTF",size: 50))
                    .padding(.top, 5)

                Text(viewModel.temp)
                    .font(.custom("Selima", size: 60))
                    .padding(.top, 5)

                Text("１時間ごとの天気")
                    .font(.custom("KouzanBrushFontOTF",size: 34))
                    .padding(.top, 5)

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