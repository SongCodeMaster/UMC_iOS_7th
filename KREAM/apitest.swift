//
//  apitest.swift
//  KREAM
//
//  Created by 송승윤 on 12/4/24.
//

import Foundation
// 외부에서 호출
APIClient.shared.testAPIKey { isKeyIncluded in
    if isKeyIncluded {
        print("✅ API Key가 제대로 포함되었습니다.")
    } else {
        print("❌ API Key가 포함되지 않았습니다.")
    }
}
