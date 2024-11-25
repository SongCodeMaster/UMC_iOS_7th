//
//  ModalViewController.swift
//  TabBarPrac
//
//  Created by 송승윤 on 10/2/24.
//

import UIKit

import SnapKit

class ModalViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 나타난다."
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemRed
       
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints{
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints{
            $0.top.equalToSuperview().inset(400)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .brown
        viewController.modalPresentationStyle = .pageSheet
        
        present(viewController, animated: true)
    }

}
