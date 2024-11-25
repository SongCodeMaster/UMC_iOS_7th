//
//  ProfileViewController.swift
//  KREAM
//
//  Created by 송승윤 on 10/4/24.
//
import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    private let profileview = ProfileView()
    private let profileModel = ProfileModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        navigationTitle()
        customBackButton()
    }
    
    // UI 세팅
    private func setupUI() {
        self.view.addSubview(profileview)
        profileview.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
        
        // 버튼 액션 추가
        profileview.emailCheckButton.addTarget(self, action: #selector(handleEmailChange), for: .touchUpInside)
        profileview.pwdCheckButton.addTarget(self, action: #selector(handlePasswordChange), for: .touchUpInside)
        
        // 텍스트 필드 비활성화 (초기 상태)
        profileview.userEmailTextfield.isUserInteractionEnabled = false
        profileview.pwdField.isUserInteractionEnabled = false
    }
    
    // UserDefaults에서 프로필 데이터 로드
    private func loadProfileData() {
        let loginData = profileModel.loadLoginData()
        profileview.userEmailTextfield.text = loginData.id
        profileview.pwdField.text = loginData.pwd
    }
    
    // 이메일 변경 버튼 액션
    @objc private func handleEmailChange() {
        if profileview.emailCheckButton.title(for: .normal) == "변경" {
            profileview.userEmailTextfield.isUserInteractionEnabled = true
            profileview.emailCheckButton.setTitle("확인", for: .normal)
        } else {
            profileview.userEmailTextfield.isUserInteractionEnabled = false
            profileview.emailCheckButton.setTitle("변경", for: .normal)
            
            // 수정된 이메일 저장하기
            if let newEmail = profileview.userEmailTextfield.text {
                profileModel.saveLoginData(id: newEmail, pwd: profileview.pwdField.text ?? "")
            }
        }
    }
    
    // 비밀번호 변경 버튼 액션
    @objc private func handlePasswordChange() {
        if profileview.pwdCheckButton.title(for: .normal) == "변경" {
            profileview.pwdField.isUserInteractionEnabled = true
            profileview.pwdCheckButton.setTitle("확인", for: .normal)
        } else {
            profileview.pwdField.isUserInteractionEnabled = false
            profileview.pwdCheckButton.setTitle("변경", for: .normal)
            
            // 수정된 비밀번호 저장
            if let newPassword = profileview.pwdField.text {
                profileModel.saveLoginData(id: profileview.userEmailTextfield.text ?? "", pwd: newPassword)
            }
        }
    }
    
    //navigation 설정
    func navigationTitle() {
        navigationItem.title = "프로필 관리"
        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
        ]
    }
    
    func customBackButton() {
        let customBackButton = UIBarButtonItem(
            image: UIImage(systemName: "arrow.backward"),
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
        customBackButton.tintColor = .black
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = customBackButton
    }
    
    @objc
    func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
}
