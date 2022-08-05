//
//  FortuneView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/02.
//

import SwiftUI

struct FortuneView: View {
    let randomInt = Int.random(in: 0..<18)
    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("weather6")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
            .ignoresSafeArea()
            .overlay(.ultraThinMaterial)

            VStack {
                ScrollView {
                    LazyVStack {
                        Text("Lucky Number")
                            .font(.custom("Times-Roman", size: 60))
                            .padding(.top, 60)
                            .padding(.bottom, 2)
                        Text("\(randomInt + 1)")
                            .font(.custom("Selima", size: 120))
                        Image(horsesImage[randomInt])
                            .resizable()
                            .frame(width: 300, height: 200)
                        Text(horses[randomInt])
                            .font(.custom("KouzanBrushFontOTF", size: 50))
                            .padding(.top, 30)
                            .padding(.bottom, 100)
                    }
                }
            }
        }
    }
}



struct FortuneView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneView()
    }
}
