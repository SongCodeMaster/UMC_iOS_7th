//
//  ProfileModel.swift
//  KREAM
//
//  Created by 송승윤 on 10/11/24.
//

import Foundation
class ProfileModel {
    private let userDefaults = UserDefaults.standard
    private let idKey = "userID"
    private let pwdKey = "userPwd"
    
    // 로그인 정보를 저장
    public func saveLoginData(id: String, pwd: String) {
        userDefaults.set(id, forKey: idKey)
        userDefaults.set(pwd, forKey: pwdKey)
    }
    
    // 저장된 로그인 정보 불러오기
    public func loadLoginData() -> (id: String?, pwd: String?) {
        let id = userDefaults.string(forKey: idKey)
        let pwd = userDefaults.string(forKey: pwdKey)
        return (id, pwd)
    }
    
    // 저장된 로그인 정보 삭제
    public func clearLoginData() {
        userDefaults.removeObject(forKey: idKey)
        userDefaults.removeObject(forKey: pwdKey)
    }
}
