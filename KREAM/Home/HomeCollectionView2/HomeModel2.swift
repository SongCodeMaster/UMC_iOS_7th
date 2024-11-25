//
//  File.swift
//  KREAM
//
//  Created by 송승윤 on 11/6/24.
//

import UIKit

struct HomeModel2 {
    let image: UIImage
    let brand: String
    let name: String
    let price: String
    let immediate: String
}
extension HomeModel2 {
    static func dummy() -> [HomeModel2] {
        return [
            HomeModel2(image: .collection2Image1, brand: "MLB", name: "청키라이너 뉴욕양키스", price: "139,000원", immediate: "즉시구매가"),
            HomeModel2(image: .collection2Image2, brand: "Jordan", name: "Jordan 1 Retro High OG Yellow Ochre", price: "228,000원", immediate: "즉시구매가"),
            HomeModel2(image: .collection2Image3, brand: "Human Made", name: "Human Made x Kaws Varsity Jacket", price: "2,000,000원", immediate: "즉시구매가")
        ]
    }
}
