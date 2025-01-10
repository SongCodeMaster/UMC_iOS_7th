//
//  LoginView.swift
//  KreamApp
//
//  Created by KKM on 9/27/24.
//

import UIKit

class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()  // 필요한 UI 컴포넌트 추가
        self.setupConstraints()  // UI 요소들의 제약 조건 설정
        self.setupActions()  // 텍스트 필드 변경 감지
    }
    
    // UI 요소들을 뷰에 추가하는 메서드
    private func addComponents() {
        self.addSubview(kreamImageView)
        self.addSubview(mailLabel)
        self.addSubview(mailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(kakaoLoginButton)
        self.addSubview(appleLoginButton)
    }
    
    // 오토레이아웃 설정 메서드
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            kreamImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126),
            kreamImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kreamImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53),
            kreamImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53),
            
            mailLabel.topAnchor.constraint(equalTo: kreamImageView.bottomAnchor, constant: 87),
            mailLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 45),
            mailLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45),
            
            mailTextField.topAnchor.constraint(equalTo: mailLabel.bottomAnchor, constant: 8),
            mailTextField.leftAnchor.constraint(equalTo: mailLabel.leftAnchor),
            mailTextField.rightAnchor.constraint(equalTo: mailLabel.rightAnchor),
            mailTextField.heightAnchor.constraint(equalToConstant: 34),
            
            passwordLabel.topAnchor.constraint(equalTo: mailTextField.bottomAnchor, constant: 17),
            passwordLabel.leftAnchor.constraint(equalTo: mailLabel.leftAnchor),
            passwordLabel.rightAnchor.constraint(equalTo: mailLabel.rightAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leftAnchor.constraint(equalTo: mailLabel.leftAnchor),
            passwordTextField.rightAnchor.constraint(equalTo: mailLabel.rightAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 34),
            
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            loginButton.leftAnchor.constraint(equalTo: mailLabel.leftAnchor),
            loginButton.rightAnchor.constraint(equalTo: mailLabel.rightAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 38),
            
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            kakaoLoginButton.leftAnchor.constraint(equalTo: mailLabel.leftAnchor),
            kakaoLoginButton.rightAnchor.constraint(equalTo: mailLabel.rightAnchor),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: 40),
            
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: 22),
            appleLoginButton.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            appleLoginButton.widthAnchor.constraint(equalTo: mailLabel.widthAnchor),
            appleLoginButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // 입력된 이메일과 비밀번호가 유효한지 확인하고, 로그인 버튼의 상태를 업데이트
    @objc private func textFieldsDidChange() {
        let isEmailValid = isValidEmail(mailTextField.text ?? "")
        let isPasswordValid = isValidPassword(passwordTextField.text ?? "")
        
        // 이메일과 비밀번호가 유효할 경우 로그인 버튼의 배경색을 검정색으로 변경
        if isEmailValid && isPasswordValid {
            loginButton.backgroundColor = .black
        } else {
            loginButton.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)  // 기본 회색
        }
    }
    
    // 이메일과 비밀번호 입력값을 변경 감지
    private func setupActions() {
        mailTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    // 이메일 유효성 검사 함수
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    // 비밀번호 유효성 검사 함수
    private func isValidPassword(_ password: String) -> Bool {
        return !password.isEmpty
    }
    
    // NSCoder로 초기화할 때 필요한 메서드
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Kream 로고를 위한 UIImageView
    public lazy var kreamImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo")  // "kreamLogo" 이미지를 로드
        imageView.contentMode = .scaleAspectFit  // 이미지가 적절한 비율로 맞춰지도록 설정
        imageView.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        return imageView
    }()
    
    // 이메일 레이블
    public lazy var mailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        return label
    }()
    
    // 이메일 텍스트 필드
    public lazy var mailTextField: UITextField = {
        let textField = PaddedTextField()
        textField.borderStyle = .none  // 기본 테두리 스타일 제거
        textField.placeholder = "예) kream@kream.co.kr"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 15  // 둥근 모서리
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)  // 여백 설정
        textField.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        
        // 이메일 입력 시 자동 대문자화를 없앰
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        return textField
    }()
    
    // 비밀번호 라벨
    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        return label
    }()
    
    // 비밀번호 텍스트 필드
    public lazy var passwordTextField: UITextField = {
        let textField = PaddedTextField()
        textField.borderStyle = .none  // 기본 테두리 스타일 제거
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.isSecureTextEntry = true  // 비밀번호 입력
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    // 로그인 버튼
    public lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("로그인", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = UIColor(red: 0.851, green: 0.851, blue: 0.851, alpha: 1)  // 초기 회색
        btn.layer.cornerRadius = 8
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    // 카카오 로그인 버튼
    public lazy var kakaoLoginButton: UIButton = {
        let btn = UIButton(type: .system)
        
        
        var config = UIButton.Configuration.plain() // plain, filled 등 선택 가능
        config.title = "카카오로 로그인"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.cornerStyle = .medium // 모서리 둥글기 설정
        
        // 이미지 설정
        config.image = UIImage(named: "kakaoIcon")
        config.imagePadding = 10 // 텍스트와 이미지 간격 설정
        config.imagePlacement = .leading // 이미지 위치 (텍스트 앞쪽)
        
        // 테두리 설정
        config.background.strokeColor = .black  // 테두리 색상
        config.background.strokeWidth = 0.2       // 테두리 두께
        
        
        btn.configuration = config
        btn.configurationUpdateHandler = { button in
            button.configuration?.image = UIImage(named: "kakaoIcon")
        }
        btn.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        return btn
    }()
    
    
    // 애플 로그인 버튼
    public lazy var appleLoginButton: UIButton = {
        let btn = UIButton(type: .system)
        var config = UIButton.Configuration.plain() // plain, filled 등 선택 가능
        config.title = "Apple로 로그인"
        config.baseForegroundColor = .black
        config.baseBackgroundColor = .white
        config.cornerStyle = .medium // 모서리 둥글기 설정
        
        
        // 이미지 설정
        config.image = UIImage(named: "appleIcon")
        config.imagePadding = 10 // 텍스트와 이미지 간격 설정
        config.imagePlacement = .leading // 이미지 위치 (텍스트 앞쪽)
        
        // 테두리 설정
        config.background.strokeColor = .black  // 테두리 색상
        config.background.strokeWidth = 0.2       // 테두리 두께
        
        btn.configuration = config
        btn.configurationUpdateHandler = { button in
            button.configuration?.image = UIImage(named: "appleIcon")
        }
        btn.translatesAutoresizingMaskIntoConstraints = false  // 오토레이아웃 적용
        return btn
    }()
    
}

class PaddedTextField: UITextField {
    var textPadding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textPadding)
    }
}
