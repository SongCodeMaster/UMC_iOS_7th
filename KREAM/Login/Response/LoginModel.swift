//
//  LoginModel.swift
//  KREAM
//
//  Created by 송승윤 on 9/27/24.
//
import Foundation

// 사용자 정보를 저장할 User 모델
struct User: Codable {
    let id: String
    let pwd: String
    let nickname: String?
    let email: String?
    let profileImageUrl: String?
}

class LoginModel {
    private let userDefaults = UserDefaults.standard
    // 기존 키
    private let idKey = "userID"
    private let pwdKey = "userPwd"
    
    // 확장된 사용자 정보 키
    private let userKey = "userinfo"
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
    // MARK: - 확장된 기능(API 사용하기 위한 사용자 정보인 User 구조체를 정의, Codable을 준수하여 JSON 형태로 인코딩)
    
    // 사용자 정보를 저장, User 객체를 JSON으로 인코딩하여 UserDefaults에 저장
    public func saveUser(_ user: User) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(user) {
            userDefaults.set(encoded, forKey: userKey)
        }
    }
    
    // UserDefaults에서 데이터를 불러와 User 객체로 디코딩. 저장된 사용자 정보를 불러오기
    public func loadUser() -> User? {
        guard let data = userDefaults.data(forKey: userKey) else {return nil}
        let decoder = JSONDecoder()
        return try? decoder.decode(User.self, from: data)
    }
    
    // 저장된 사용자 정보 삭제
    public func clearUser() {
        userDefaults.removeObject(forKey: userKey)
    }
}
