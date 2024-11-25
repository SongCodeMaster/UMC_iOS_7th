//
//  File.swift
//  KREAM
//
//  Created by 송승윤 on 11/6/24.
//

import UIKit

struct HomeModel3 {
    let image: UIImage
}

extension HomeModel3 {
    static func dummy() -> [HomeModel3] {
        return [
            HomeModel3(image: .lookBookImage1),
            HomeModel3(image: .lookBookImage2),
            HomeModel3(image: .lookBookImage3)
        ]
    }
}
