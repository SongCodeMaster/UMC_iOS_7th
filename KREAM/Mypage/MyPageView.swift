import UIKit
import SnapKit

class MyPageView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 톱니바퀴 이미지 뷰
    public lazy var wheelImageView: UIImageView = {
        let wheelView = UIImageView()
        wheelView.image = UIImage(named: "wheel")  // 톱니바퀴 이미지 설정
        wheelView.contentMode = .scaleAspectFit     // 이미지 비율 유지
        wheelView.translatesAutoresizingMaskIntoConstraints = false
        return wheelView
    }()
    // 카메라 이미지 뷰
    public lazy var cameraImageView: UIImageView = {
        let cameraView = UIImageView()
        cameraView.image = UIImage(named: "camera")
        cameraView.contentMode = .scaleAspectFit
        cameraView.translatesAutoresizingMaskIntoConstraints = false //오토레이아웃 적용
        return cameraView
    }()
    // 프로필 이미지 뷰
    public lazy var profileImageView: UIImageView = {
        let profileView = UIImageView() //profileView에 UIImageView 속성 넣기
        profileView.image = UIImage(named: "profile") //이미지 불러오기
        profileView.contentMode = .scaleAspectFit // 화면 비율에 맞게
        profileView.translatesAutoresizingMaskIntoConstraints = false
        return profileView
    }()
    //프로필 라벨
    public lazy var profileLabel: UILabel = {
        let label = UILabel()
        
        // 텍스트 구성
        let mainText = "Jeong_iOS\n"
        let followerText = "팔로워 326  팔로잉 20"
        let fullText = "\(mainText)\(followerText)"
        
        // NSMutableAttributedString으로 전체 텍스트 생성
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // 각 줄의 폰트 스타일 설정
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 16, weight: .bold), range: NSRange(location: 0, length: mainText.count))
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 14, weight: .regular), range: NSRange(location: mainText.count, length: followerText.count))
        
        // NSMutableParagraphStyle 설정 - 줄 간격 조정
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6 // 줄 간격 설정
        
        // 전체 문자열에 대한 paragraphStyle 적용
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: fullText.count))
        
        // UILabel에 적용
        label.attributedText = attributedString
        label.textColor = .black
        label.numberOfLines = 0 // 여러 줄 표시 설정
        
        return label
    }()
    
    // 프로필 관리 버튼
    public lazy var profileButton1: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("프로필 관리", for: .normal) //버튼의 상태 .normal은 기본 상태를 의미하며, 아무런 동작을 하지 않을때 나타나는상태
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular) //버튼 폰트 크기 설정
        btn.setTitleColor(.black, for: .normal) //버튼 색지정
        btn.layer.cornerRadius = 8 //버튼의 코너 둥글게
        btn.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정  회색)
        btn.layer.borderWidth = 1.0 // 테두리 두께 설정
        btn.translatesAutoresizingMaskIntoConstraints = false
        
        return btn
    }()
    // 프로필 공유 버튼
    public lazy var profileButton2: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("프로필 공유", for: .normal) //버튼의 상태 .normal은 기본 상태를 의미하며, 아무런 동작을 하지 않을때 나타나는상태
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 9, weight: .regular) //버튼 폰트 크기 설정
        btn.setTitleColor(.black, for: .normal) //버튼 색지정
        btn.layer.cornerRadius = 8
        btn.layer.borderColor = UIColor.gray.cgColor // 테두리 색상 설정  회색)
        btn.layer.borderWidth = 1.0 // 테두리 두께 설정
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        addComponents()
        setupConstraints()
    }
    
    
    private func addComponents() { //Components 추가
        self.addSubview(wheelImageView)
        self.addSubview(cameraImageView)
        self.addSubview(profileImageView)
        self.addSubview(profileLabel)
        self.addSubview(profileButton1)
        self.addSubview(profileButton2)
    }
    
    private func setupConstraints() {
        wheelImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(75)
            make.leading.equalToSuperview().offset(32.5)
            make.width.height.equalTo(25)
            make.width.width.equalTo(25)
        }
        cameraImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(75)
            make.trailing.equalToSuperview().offset(-32.5)
            make.width.height.equalTo(25)
        }
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(wheelImageView).offset(51)
            make.leading.equalTo(wheelImageView)
            make.width.height.equalTo(90)
        }
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView).offset(21)
            make.leading.equalTo(profileImageView).offset(106)
        }
        profileButton1.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView).offset(52)
            make.leading.equalTo(profileImageView)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        profileButton2.snp.makeConstraints { make in
            make.bottom.equalTo(profileImageView).offset(52)
            make.leading.equalTo(profileButton1).offset(171)
            make.width.equalTo(157)
            make.height.equalTo(26)
            
        }
    }
}
