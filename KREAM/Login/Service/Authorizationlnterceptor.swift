//
//  Authorizationlnterceptor.swift
//  KREAM
//
//  Created by 송승윤 on 11/25/24.
//

import Alamofire
import Foundation

final class AuthorizationInterceptor: RequestInterceptor {
    private let kakaoKey: String
    
    init(kakaoKey: String) {
        self.kakaoKey = kakaoKey
    }
    
    // 요청에 kakaoAK 헤더 추가
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        // Authorization 헤더에 kakaoAK 인증 키 추가
        request.setValue("KakaoAK \(kakaoKey)", forHTTPHeaderField: "Authorization")
        completion(.success(request))
    }
    
    //실패한 요청에 대한 재시도 처리
    func retry(_ request: Request, for session: Session, dueTo error: any Error, completion: @escaping (RetryResult) -> Void) {
        // HTTP 상태 코드 확인
        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 401 {
            // 401 Unauthrized 상태인 경우 재시도하지 않음
            print("KakaoAK 인증 실패: 401 Unauthorized")
            completion(.doNotRetry)
        } else if let response = request.task?.response as? HTTPURLResponse, response.statusCode >= 500 {
            //500번대 서버 오류인 경우 재시도
            print("서버 오류 밠애: \(response.statusCode).재시도 처리.")
            completion(.retry)
        } else {
            // 그 외 에러는 재시도하지 않는다.
            print("요청 실패: \(error.localizedDescription)")
            completion(.doNotRetry)
        }
    }
}
