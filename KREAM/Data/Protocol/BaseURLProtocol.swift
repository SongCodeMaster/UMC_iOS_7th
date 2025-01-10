//
//  BaseURLProtocol.swift
//  KREAM
//
//  Created by 송승윤 on 1/8/25.
//

import Foundation
import Moya

protocol BaseURLProtocol: TargetType {}

extension BaseURLProtocol {
    var baseURL: URL {
        guard let url = URL(string: SecretClass.shared.baseURL()) else {
            fatalError("print: \(SecretClass.shared.baseURL())")
        }
        return url
    }
}
