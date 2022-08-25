//
//  FortuneViewModel.swift
//  HorseWeather
//
//  Created by 児島　陸斗 on 2022/08/03.
//

import Foundation
import SwiftUI



var horses =  ["デアリングタクト","コントレイル","ジャックドール","タイトルホルダー","ソダシ","オルフェーブル","エフフォーリア","パンサラッサ","ステラヴェローチェ","オニャンコポン","ファインルージュ","メイケイエール","ドウドゥース","ジオグリフ","メロディーレーン","アカイイト","レッドジェネシス","オーソリティ", "?"]

var horsesImage = [ "DaringTact","Contrail","Jackdol","Titleholder","Sodashi","Orfevre","Efforia","Panthalassa","StellaVeloce","Onyankopon","FineRouge","MeikeiYell","DoDeuce","Geoglyph","MelodyLane","Akaiito","RedGenesis","Authority","random"]

func sharePost(shareText: String, shareImage: UIImage, shareUrl: String) {
    let activityItems = [shareText, shareImage, URL(string: shareUrl)!] as [Any]
    let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
    let viewController = UIApplication.shared.windows.first?.rootViewController
    viewController?.present(activityVC, animated: true)
}
