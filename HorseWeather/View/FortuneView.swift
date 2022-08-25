//
//  FortuneView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/02.
//

import SwiftUI

struct FortuneView: View {
//    @State var randomInt = Int.random(in: 0..<18)
    @State var randomInt = 18
    @State private var opacity = 0

    let gradientView = LinearGradient(
        gradient: Gradient(colors: [Color.blue, Color.yellow]),
        startPoint: .leading,
        endPoint: .trailing)

    var body: some View {
        ZStack {
            GeometryReader {proxy in
                Image("yellow")
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
                            .font(.custom("Times-Roman", size: 55))
                            .padding(.top, 50)
                            .padding(.bottom, 2)
                        Text("\(randomInt + 1)")
                            .font(.custom("Selima", size: 120))
                            .opacity(Double(opacity))  

                        Image(horsesImage[randomInt])
                            .resizable()
                            .frame(width: 300, height: 200)
                            .cornerRadius(20)
                        Text(horses[randomInt])
                            .font(.custom("KouzanBrushFontOTF", size: 40))
                            .padding(.top, 10)
                        //                            .padding(.bottom, 100)

                        Button(action: {
                            randomInt = Int.random(in: 0..<18)
                            opacity = 1
                        }) {
                            Text("Fortune")
                                .frame(width: 150, height: 50)
                                .foregroundColor(.white)
                                .background(
                                    gradientView)
                                .cornerRadius(40)
                                .padding(.top, 30)
                                .padding(.bottom, 30)
                        }

                        Button(action: {
                            sharePost(shareText: "お天気競馬場 ラッキーナンバーは\(randomInt + 1)番！", shareImage: UIImage(named: horsesImage[randomInt])!, shareUrl: "https://apps.apple.com/us/app/%E3%81%8A%E5%A4%A9%E6%B0%97%E7%AB%B6%E9%A6%AC%E5%A0%B4/id1637432269?itsct=apps_box_link&itscg=30200")
                        }) {
                            Text("Share")
                                .frame(width: 150, height: 50)
                                .foregroundColor(.white)
                                .background(
                                    gradientView)
                                .cornerRadius(40)
                                .padding(.bottom, 100)
                        }
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
