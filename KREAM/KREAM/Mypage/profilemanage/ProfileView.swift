//
//  profileManageView.swift
//  KREAM
//
//  Created by 송승윤 on 10/4/24.
//

import UIKit
import SnapKit

class ProfileView: UIView {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.addComponets()
        self.setupConstraints()
    }
    
    //프로필 UI
    public lazy var profileImage: UIImageView = {
        let proImage = UIImageView()
        proImage.image = UIImage(named: "profile")
        proImage.contentMode = .scaleAspectFit
        proImage.translatesAutoresizingMaskIntoConstraints = false
        return proImage
    }()
    //프로필 정보 라벨
    public lazy var profileInformation: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃적용
        return label
    }()
    //유저 이메일 라벨
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.text = "유저 이메일"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //유저 비밀번호 라벨
    public lazy var userPassword: UILabel = {
        let label = UILabel()
        label.text = "유저 비밀번호"
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //유저 이메일 텍스트 필드
    public lazy var userEmailTextfield: UITextField = {
        let filed = UITextField()
        filed.placeholder = "예) kream@kream.co.kr"
        filed.font = UIFont.systemFont(ofSize: 12)
        filed.layer.cornerRadius = 15
        return filed
    }()
    
    //비번 이메일 텍스트 필드
    public lazy var pwdField: UITextField = {
        let field = UITextField()
        field.placeholder = "비밀번호를 입력해주세요"
        field.font = .systemFont(ofSize: 12)
        field.layer.cornerRadius = 15
        return field
    }()
    
    //버튼
    let createProfileBtn: (String) -> UIButton = {title in
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGray.cgColor
        button.layer.cornerRadius = 8
        return button
    }
    
    lazy var emailCheckButton = createProfileBtn("변경")
    lazy var pwdCheckButton = createProfileBtn("변경")
    
    private func addComponets() {
        self.addSubview(profileImage)
        self.addSubview(profileInformation)
        self.addSubview(userEmailLabel)
        self.addSubview(userEmailTextfield)
        self.addSubview(userPassword)
        self.addSubview(pwdField)
        self.addSubview(emailCheckButton)
        self.addSubview(pwdCheckButton)
    }
    private func setupConstraints() {
        profileImage.snp.makeConstraints{make in
            make.top.equalTo(safeAreaLayoutGuide.snp.top).offset(52)
            make.leading.equalToSuperview().offset(151)
            make.trailing.equalToSuperview().offset(-151)
            make.height.width.equalTo(90)
        }
        profileInformation.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        userEmailLabel.snp.makeConstraints {
            $0.top.equalTo(profileInformation.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        userEmailTextfield.snp.makeConstraints {
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalTo(emailCheckButton.snp.leading).offset(-9)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        userPassword.snp.makeConstraints {
            $0.top.equalTo(userEmailTextfield.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalToSuperview().offset(-25)
        }
        
        pwdField.snp.makeConstraints {
            $0.top.equalTo(userPassword.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(25)
            $0.trailing.equalTo(pwdCheckButton.snp.leading).offset(-9)
            $0.width.equalTo(282)
            $0.height.equalTo(32)
        }
        
        emailCheckButton.snp.makeConstraints {
            $0.leading.equalTo(userEmailTextfield.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().offset(-17)
            $0.top.equalTo(userEmailLabel.snp.bottom).offset(4)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
        
        pwdCheckButton.snp.makeConstraints {
            $0.leading.equalTo(pwdField.snp.trailing).offset(9)
            $0.trailing.equalToSuperview().offset(-17)
            $0.top.equalTo(userPassword.snp.bottom).offset(4)
            $0.width.equalTo(58)
            $0.height.equalTo(32)
        }
    }
}


