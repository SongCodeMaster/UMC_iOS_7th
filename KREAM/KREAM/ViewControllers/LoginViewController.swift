//
//  ViewController.swift
//  KREAM
//
//  Created by 송승윤 on 9/27/24.
//

import UIKit

class LoginViewController: UIViewController {

    private let loginView = LoginView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = loginView
    }
}

