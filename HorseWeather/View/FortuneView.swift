//
//  FortuneView.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/02.
//

import SwiftUI

struct FortuneView: View {
    let randomInt = Int.random(in: 0..<19)

    var body: some View {
        VStack {
            ScrollView {
                LazyVStack {
                    Text("今日のラッキーナンバー")
                        .font(.custom("KouzanBrushFontOTF", size: 32))
                        .padding(.top, 100)
                        .padding(.bottom, 20)
                    Text("\(randomInt + 1)")
                        .font(.custom("Selima", size: 80))
                    Image(horsesImage[randomInt])
                        .resizable()
                        .frame(width: 300, height: 200)
                    Text(horses[randomInt])
                        .font(.custom("KouzanBrushFontOTF", size: 45))
                        .padding(.top, 10)
                }
            }
        }
    }
}

var horses =  ["メイケイエール","コントレイル","ジャックドール","タイトルホルダー","ソダシ","オルフェーブル","エフフォーリア","パンサラッサ","ステラヴェローチェ","オニャンコポン","ファインルージュ","メイケイエール","ドウドゥース","ジオグリフ","メロディーレーン","アカイイト","レッドジェネシス","オーソリティ"]

var horsesImage = [ "number1","number2","number3","number4","number5","number6","number7","number8","number9","number10","number11","number12","number13","number14","number15","number16","number17","number18",]
//
//    let item = horses.randomElement()





struct FortuneView_Previews: PreviewProvider {
    static var previews: some View {
        FortuneView()
    }
}
