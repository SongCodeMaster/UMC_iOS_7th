//
//  profileManageViewController.swift
//  KREAM
//
//  Created by 송승윤 on 10/4/24.
//

import UIKit

class profileManageViewController: UIViewController {
    private let pmView = ProfileManageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    private func setupUI() {
        // profileManageView를 컨트롤러의 view에 추가
        view.addSubview(ProfileManageView)
        
        // SnapKit을 사용하여 myPageView의 제약 조건 설정
        ProfileManageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
