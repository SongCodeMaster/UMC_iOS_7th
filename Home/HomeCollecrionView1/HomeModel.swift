//
//  File.swift
//  KREAM
//
//  Created by 송승윤 on 11/1/24.
//

import UIKit

struct HomeModel {
    let image: UIImage
    let name: String
}
extension HomeModel{
    static func dummy() -> [HomeModel] {
        return [
            HomeModel(image: .collectionImage1, name: "크림 드로우"),
            HomeModel(image: .collectionImage2, name: "실시간 차트"),
            HomeModel(image: .collectionImage3, name: "남성 추천"),
            HomeModel(image: .collectionImage4, name: "여성 추천"),
            HomeModel(image: .collectionImage5, name: "색다른 추천"),
            HomeModel(image: .collectionImage6, name: "정가 아래"),
            HomeModel(image: .collectionImage7, name: "윤세 24AW"),
            HomeModel(image: .collectionImage8, name: "올해의 베스트"),
            HomeModel(image: .collectionImage9, name: "10월 베네핏"),
            HomeModel(image: .collectionImage10, name: "1아크네 선물")
        ]
    }
}
