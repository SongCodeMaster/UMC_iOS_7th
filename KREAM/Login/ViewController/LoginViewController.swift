import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {
    
    // UserDefaults에 로그인 데이터를 저장하고 불러오는 LoginModel 인스턴스 생성
    private var loginModel = LoginModel()
    
    // 로그인 화면에 사용될 LoginView
    private var loginView: LoginView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // LoginView 초기화 및 추가
        loginView = LoginView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(loginView)
        
        // 오토레이아웃 설정
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
        // 로그인 버튼에 액션 추가
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        // 카카오 로그인 버튼에 액션 연결
        loginView.kakaoLoginButton.addTarget(self, action: #selector(handleKakaoLogin), for: .touchUpInside)
        // 화면이 로드될 때 저장된 로그인 정보가 있으면 불러옴
        loadLoginData()
    }
    
    // 카카오 로그인 버튼이 눌렸을 때 호출되는 메서드, 카카오톡 앱이 설치되어 있는지 확인 후 적절한 로그인 방법 선택하게 함
       @objc private func handleKakaoLogin() {
           // 카카오톡 앱이 기기에 설치되어 있는지 확인
           if UserApi.isKakaoTalkLoginAvailable() {
               // 카카오톡 앱으로 로그인, 토큰과 에러를 가지고 처리
               UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
                   if let error = error {
                       print("카카오톡 로그인 실패: \(error)") // 실패시 처리
                   } else {
                       print("카카오톡 로그인 성공")
                       self.handleLoginSuccess(oauthToken: oauthToken) // 반환된 인증 토큰을 활용하여 카카오 로그인 성공 호출
                   }
               }
           } else {
               // 카카오 계정으로 로그인 (웹뷰)
               UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                   if let error = error {
                       print("카카오 계정 로그인 실패: \(error)")
                   } else {
                       print("카카오 계정 로그인 성공")
                       self.handleLoginSuccess(oauthToken: oauthToken)
                   }
               }
           }
       }
    
    // 카카오 로그인 성공 시 호출되는 메서드, 로그인을 성공했을시에 카카오 SDK가 OAuth토큰을 반환한다.
    private func handleLoginSuccess(oauthToken: OAuthToken?) {
        guard let token = oauthToken else { return } // 로그인 성공 시 반환된 OAuthToken 객체가 nil인지 확인, nil이면 실패로 간주하고 매서드를 return(종료)한다, 성공이면 token 변수에 언래핑된 oauthToken객체 저장
        
        print("Access Token: \(token.accessToken)") // 카카오로부터 반환된OAthToken객체에서 AceessToken을 추출, API 호출 시 인증을 위해 사용된다.
        
        // 사용자 정보 요청 코드, UserApi.shared.me는 사용자 정보를 가져오는 메서드이다. 로그인된 사용자 정보를 JSON형태로 변환하며, User 객체에 매핑된다.
        UserApi.shared.me { (user, error) in
            if let error = error {
                print("사용자 정보 요청 실패: \(error)") // 에러처리
            } else {
                print("사용자 정보 요청 성공")
                if let user = user { // 요청이 성공하면 user 객체에 사용자 정보가 저장된다, 사용자 정보에서 ID,닉네임,이메일을 추출하여 출력하게 된다.
                    print("사용자 ID: \(user.id ?? 0)") // 사용자 고유 ID
                    print("닉네임: \(user.kakaoAccount?.profile?.nickname ?? "")") // 사용자의 닉네임
                    print("이메일: \(user.kakaoAccount?.email ?? "")") // 사용자의 이메일
                    
                    // 로그인 성공 후 다음 화면으로 이동
                    self.buttonDidTap()
                }
            }
        }
    }
    
    
    // 로그인 버튼을 눌렀을 때 호출되는 메서드
    @objc private func handleLogin() {
        // 사용자 입력값을 가져와서 모델에 저장
        guard let id = loginView.mailTextField.text, !id.isEmpty,
              let pwd = loginView.passwordTextField.text, !pwd.isEmpty else {
            showAlert(message: "이메일과 비밀번호를 입력하세요.")
            return
        }
        
        // 로그인 데이터를 UserDefaults에 저장
        loginModel.saveLoginData(id: id, pwd: pwd)
        
        // 간단한 처리: 콘솔에 저장된 데이터 출력 (디버깅용)
        print("ID: \(id), PWD: \(pwd)")
        
        // 로그인 성공 처리 로직 추가
        buttonDidTap()
    }
    
    // 저장된 로그인 정보가 있으면 불러와서 텍스트 필드에 자동 입력
    private func loadLoginData() {
        let loginData = loginModel.loadLoginData()
        loginView.mailTextField.text = loginData.id
        loginView.passwordTextField.text = loginData.pwd
    }

    // 경고창을 띄우는 메서드
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "알림", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    // 로그인 성공 시 다음 화면으로 전환
    @objc private func buttonDidTap() {
        let baseVC = BaseViewController()
        baseVC.modalPresentationStyle = .fullScreen
        present(baseVC, animated: true)
    }
    
}

