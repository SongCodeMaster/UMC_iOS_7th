//
//  APIClient.swift
//  KREAM
//
//  Created by 송승윤 on 11/25/24.
//

import Foundation
import Alamofire

final class APIClient {
    static let shared = APIClient() //singleton 인스턴스
    
    // 네트워크 요청(HTTP 요청 생성,관리)을 처리하는 데 사용되는 핵심 객체
    // 이 코드에서는 AuthorizationInterceptor를 세션에 추가하여 요청마다 인증 헤더를 자동으로 추가
    private let session: Session
    
    private init() {
        let interceptor = AuthorizationInterceptor(kakaoKey: "636b9aafa498defce057a61d8e9b2c68")
        session = Session(interceptor: interceptor)
    }
    
    // 네트워크 요청을 처리하는 재사용 가능한 메서드, 제네릭 타입 T를 사용하여 다양한 응답 처리
    // T는 Codable 프로토콜을 준수해야 한다, Codable은 데이터 인코딩 및 디코딩이 가능한 타입.
    public func request<T: Codable>(
        _ url: String,
        method: HTTPMethod = .get, // HTTPMethod(GET,POST) 지정
        parameters: Parameters? = nil, // 요청에 필요한 쿼리 파라미터 또는 Body 데이터를 전달
        completion: @escaping (Result<T, Error>) -> Void // 네트워크 요청 완료 후 실행할 클로저, 요청 결과를 Result<T, Error>타입으로 반환
    ){
        session.request(url, method: method, parameters: parameters) // session 객체를 사용해 네트워크 요청 생성, 전달받은 파라미터로 요청 설정
            .validate() // 응답 검증 상태 코드 200~299 범위인 경우만 성공으로 간주
            .responseDecodable(of: T.self) { response in // 서버에서 응답받은 JSON 데이터를 제네릭 타입 T로 디코딩
                switch response.result {
                case .success(let value) : // 요청 성공 시 제네릭 타입 T의 데이터를 반환.
                    completion(.success(value))
                case .failure(let error): // 요청 실패 시 에러 객체를 반환.
                    completion(.failure(error))
                }
            }
    }
}



extension APIClient {
    func testAPIKey(completion: @escaping (Bool) -> Void) {
        // 테스트용 API URL (GET 요청 가능하고 인증 필요 없는 간단한 URL)
        let testURL = "https://jsonplaceholder.typicode.com/posts/1"
        
        session.request(testURL)
            .response { response in
                if let headers = response.request?.allHTTPHeaderFields {
                    print("Request Headers: \(headers)") // 요청 헤더 확인
                    if headers["Authorization"] == "Bearer my apikey" {
                        completion(true) // API Key가 제대로 포함됨
                    } else {
                        completion(false) // API Key가 포함되지 않음
                    }
                } else {
                    completion(false) // 요청 헤더를 가져오지 못함
                }
            }
    }
}

