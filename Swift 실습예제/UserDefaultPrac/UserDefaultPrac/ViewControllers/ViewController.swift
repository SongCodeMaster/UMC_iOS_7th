//
//  ViewController.swift
//  UserDefaultPrac
//
//  Created by 송승윤 on 10/10/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let userDefaultsModel = UserDefaultsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = userDefaultsview
    }
    
    private lazy var userDefaultsview: UserDefaultsView = {
        let view = UserDefaultsView()
        view.saveButton.addTarget(self, action: #selector(saveButtonClicked), for: .touchUpInside)
        return view
    }()
    
    @objc func saveButtonClicked() {
        guard let text = userDefaultsview.inputTextField.text, !text.isEmpty else {
            return
        }
        // 모델을 통해 텍스트 저장
        userDefaultsModel.saveUserText(text)
        // 저장된 텍스트 라벨에 표시
        userDefaultsview.showTextValue.text = text
    }
    private func loadTextValue() {
        if let savedText = userDefaultsModel.loadUserText() {
            userDefaultsview.showTextValue.text = savedText
        }
    }
}
