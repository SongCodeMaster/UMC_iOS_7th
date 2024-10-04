import UIKit
import SnapKit  // SnapKit을 사용하는 경우 추가

class BaseViewController: UITabBarController {
    
    
    // 각 뷰컨트롤러 선언
    private let homeVC = HomeViewController()
    private let styleVC = StyleViewController()
    private let shopVC = ShopViewController()
    private let savedVC = SavedViewController()
    private let mypageVC = UINavigationController(rootViewController: MyPageViewController())
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupTabBar()
    }
    
    
    /// 탭 바 및 뷰 컨트롤러 설정
    private func setupTabBar() {
        // 각 탭 바 아이템 설정
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: UIImage(systemName: "house"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: UIImage(systemName: "bookmark"), tag: 3)
        mypageVC.tabBarItem = UITabBarItem(title: "MY", image: UIImage(systemName: "person"), tag: 4)
        
        // 탭 바 컨트롤러에 뷰 컨트롤러 설정
        self.viewControllers = [homeVC, styleVC, shopVC, savedVC, mypageVC]
    }
}
