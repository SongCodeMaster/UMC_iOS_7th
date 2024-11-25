//
//  File.swift
//  KREAM
//
//  Created by 송승윤 on 11/15/24.
//

import Foundation

struct SizeModel {
    var size: String
    var price: String
}

final class SizeData {
    static let sizeData: [SizeModel] = [
        .init(size: "S", price: "360,000"),
        .init(size: "M", price: "360,000"),
        .init(size: "L", price: "360,000"),
        .init(size: "XL", price: "360,000"),
        .init(size: "XXL", price: "360,000"),
    ]
}
