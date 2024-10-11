import UIKit

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
        
        // 화면이 로드될 때 저장된 로그인 정보가 있으면 불러옴
        loadLoginData()
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
