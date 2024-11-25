//
//  BaseViewController.swift
//  TabBarPrac
//
//  Created by 송승윤 on 10/2/24.
//

import UIKit

class BaseViewController: UITabBarController {
    private let modalVC = ModalViewController()
    //UINavigationController는 윗상단에 뒤로가기 속성을 보니 스택 루트뷰부터 스택구조로 구성됨, 따라서 UI버튼을 눌렀을 때 pushNextVC 메서드가 호출되어 새로운 뷰 컨트롤러로 푸시됩니다.
    private let navigationVC = UINavigationController(rootViewController: NavigationViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        //tabBar 요소들
        modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "apple.terminal"), tag: 0)
        navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.full"), tag: 1)
        
        self.viewControllers = [modalVC, navigationVC]
    }
}
