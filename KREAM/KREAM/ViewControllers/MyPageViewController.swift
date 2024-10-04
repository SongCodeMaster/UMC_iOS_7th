import UIKit
import SnapKit

class MyPageViewController: UIViewController {
    
    
    private let myPageView = MyPageView()  // 커스텀 뷰 인스턴스 생성
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupUI()
        setupActions() // 버튼 액션 설정 메서드 호출
    }
    
    
    private func setupUI() {
        // myPageView를 컨트롤러의 view에 추가
        view.addSubview(myPageView)
        
        // SnapKit을 사용하여 myPageView의 제약 조건 설정
        myPageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func setupActions() {
        // profileButton1에 액션 추가
        myPageView.profileButton1.addTarget(self,
                                            action: #selector(buttonDidTap),
                                            for: .touchUpInside)
        
        // profileButton2에 액션 추가 (필요 시 별도의 메서드 사용 가능)
        myPageView.profileButton2.addTarget(self,
                                            action: #selector(buttonDidTap),
                                            for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let profile = ProfileViewController()
        // navigation 방식으로 화면 전환
        self.navigationController?.pushViewController(profile, animated: true)
    }
}
