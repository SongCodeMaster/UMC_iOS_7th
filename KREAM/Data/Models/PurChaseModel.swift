//
//  File.swift
//  KREAM
//
//  Created by 송승윤 on 11/15/24.
//

import Foundation

struct PurchaseModel: RequiredCellProtocol {
    var imageView: String
    var productName: String
}

final class PurchaseData {
    static let purchaseData: [PurchaseModel] = [
        .init(imageView: "purchase1", productName: "마뗑킴 로고 코팅 점퍼 블루"),
        .init(imageView: "purchase2", productName: "마뗑킴 로고 코팅 점퍼 퍼플"),
        .init(imageView: "purchase3", productName: "마뗑킴 로고 코팅 점퍼 청록"),
        .init(imageView: "purchase4", productName: "마뗑킴 로고 코팅 점퍼 자두"),
        .init(imageView: "purchase5", productName: "마뗑킴 로고 코팅 점퍼 빨강"),
        .init(imageView: "purchase6", productName: "마뗑킴 로고 코팅 점퍼 갈색"),
        .init(imageView: "purchase7", productName: "마뗑킴 로고 코팅 점퍼 블랙")
    ]
}
