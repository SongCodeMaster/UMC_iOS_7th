//
//  LoginView.swift
//  KREAM
//
//  Created by 송승윤 on 9/27/24.
//
import UIKit
class LoginView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //로고 이미지
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "KreamLogo.png")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    //이메일 텍스트라벨
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    //이메일 텍스트필드
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예)kream@kream.co.kr"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        
        //모서리를 더 둥글게 설정해보자
        textField.layer.cornerRadius = 15 // 값이 클수록 둥글게..!
        textField.layer.borderWidth = 1 // 테두리 두께 설정
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true // cornerRadius가 적용되도록
        return textField
    }()
    
    //비밀번호 텍스트라벨
    private let passwordLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    //비밀번호 텍스트필드
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .emailAddress
        //모서리를 더 둥글게 설정해보자
        textField.layer.cornerRadius = 15 // 값이 클수록 둥글게..!
        textField.layer.borderWidth = 1 // 테두리 두께 설정
        textField.layer.borderColor = UIColor.lightGray.cgColor // 테두리 색상
        textField.clipsToBounds = true // cornerRadius가 적용되도록
        return textField
    }()
    
    // 로그인 버튼
    private let loginButton: UIButton = {
        let button = UIButton()
        
        button.setTitle("로그인", for: .normal)
        button.backgroundColor = UIColor.lightGray
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return button
    }()
    
    // 소셜 로그인 버튼
    private let socialLogin: UIButton = {
        let button = UIButton()
        
        //버튼에 PNG 이미지 설정하기
        let buttonImage = UIImage(named: "socialLogin.png")
        button.setImage(buttonImage, for: .normal)
        
        // 이미지 크기 조정
        button.imageView?.contentMode = .scaleAspectFit // 이미지가 버튼에 맞게 비율을 유지하며 조정
        button.clipsToBounds = true // 모서리 둥글게
        return button
    }()
    
    private func addComponents() {
        // 이미지 뷰를 추가하고 오토레이아웃 설정
        self.addSubview(logoImageView)
        self.addSubview(emailLabel)
        self.addSubview(emailTextField)
        self.addSubview(passwordLabel)
        self.addSubview(passwordTextField)
        self.addSubview(loginButton)
        self.addSubview(socialLogin)
        
        //오토레이아웃 설정, 즉 기본프레임 설정을 false로 설정해야됨
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        socialLogin.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // logoImageView를 self 기준으로 오토레이아웃 설정
            logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor), // 가로 중심
            logoImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 126), // 상단에서 126pt 간격
            logoImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 53), // 좌측에서 53pt 간격
            logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -53), // 우측에서 -53pt 간격
            
            // emailTextField의 오토레이아웃 설정
            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 87), // logoImageView 아래에 배치, 간격 87pt
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 45), // 좌측에서 45pt 간격
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -45), // 우측에서 -45pt 간격
            
            // emailLabel의 오토레이아웃 설정 (emailTextField 바로 위에 배치, 24pt 간격)
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8), // emailTextField와 간격 8pt
            emailLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor), // emailTextField와 동일한 좌측 정렬
            emailLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor), // emailTextField와 동일한 우측 정렬
            
            // passwordlabel의 오토레이아웃 설정
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            passwordLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor), // emailTextField와 동일한 좌측 정렬
            passwordLabel.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor), // emailTextField와 동일한 우측 정렬
            
            //passwordTextfield의 오토레이아웃설정
            passwordTextField.topAnchor.constraint(equalTo:passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor), // emailTextField와 동일한 좌측 정렬
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor), // emailTextField와 동일한 우측 정렬
            
            // loginButton 오토레이아웃
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 17),
            loginButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            socialLogin.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 87),
            socialLogin.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            socialLogin.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            socialLogin.heightAnchor.constraint(equalToConstant: 50), // 버튼의 높이를 50으로 설정
            socialLogin.widthAnchor.constraint(equalToConstant: 1000) // 버튼의 너비를 2000으로 설정
        ])
    }
}
