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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    private func setupUI() {
        self.view.addSubview(profileview)
        profileview.snp.makeConstraints{make in
            make.edges.equalToSuperview()
        }
    }
}
