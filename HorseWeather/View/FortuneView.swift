//
//  FortuneView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/02.
//

import SwiftUI

struct FortuneView: View {
    @State var randomInt = Int.random(in: 0..<18)
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
                            .font(.custom("Times-Roman", size: 50))
                            .padding(.top, 60)
                            .padding(.bottom, 2)
                        Text("\(randomInt + 1)")
                            .font(.custom("Selima", size: 120))
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
                        }) {
                            Text("Fotune")
                                .frame(width: 150, height: 50)
                                .foregroundColor(.white)
                                .background(
                                    gradientView)
                                .cornerRadius(40)
                                .padding(.top, 30)
                                .padding(.bottom, 30)
                        }

                        Button(action: {
                            sharePost(shareText: "お天気競馬場 ラッキーナンバーの\(randomInt)番で馬券当たった！", shareImage: UIImage(named: horsesImage[randomInt])!, shareUrl: "aaaa")
                            //アプリのリンクを貼る
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

    func sharePost(shareText: String, shareImage: UIImage, shareUrl: String) {
        let activityItems = [shareText, shareImage, URL(string: shareUrl)!] as [Any]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        let viewController = UIApplication.shared.windows.first?.rootViewController
        viewController?.present(activityVC, animated: true)
    }
}



struct FortuneView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneView()
    }
}
