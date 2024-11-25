//
//  File.swift
//  UserDefaultPrac
//
//  Created by 송승윤 on 10/10/24.
//

import Foundation

class UserDefaultsModel {
    //userDefaults에 값저장하게 함
    private let userDefaults = UserDefaults.standard
    //유저텍스트 불러오기
    private let userTextKey: String = "userText"
    
    // 유저가 입력한 텍스트 저장
    public func saveUserText(_ text: String) {
        userDefaults.set(text, forKey: userTextKey)
    }
    
    // 저장된 값 불러오기
    public func loadUserText() -> String? {
        return userDefaults.string(forKey: userTextKey)
    }
}
