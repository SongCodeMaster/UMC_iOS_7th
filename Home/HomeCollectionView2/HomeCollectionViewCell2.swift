import UIKit
import SnapKit
import Then

class HomeCollectionViewCell2: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell2"
    
    // 이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    
    // 라벨들
    let brandLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
    }
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .darkGray
        $0.numberOfLines = 2
    }
    
    let priceLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .bold)
        $0.textColor = .black
    }
    
    let immediateLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.textColor = .gray
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(imageView)
        contentView.addSubview(brandLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(immediateLabel)
        
        // 이미지 뷰 레이아웃
        imageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.width.height.equalTo(142)
        }
        
        // 브랜드 라벨 레이아웃
        brandLabel.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(4) // 좌우 여백 추가
        }
        
        // 이름 라벨 레이아웃
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(3)
            $0.leading.trailing.equalTo(brandLabel) // 좌우 여백 추가
        }
        
        // 가격 라벨 레이아웃
        priceLabel.snp.makeConstraints {
            $0.top.equalTo(brandLabel.snp.bottom).offset(43)
            $0.leading.trailing.equalTo(nameLabel) // 좌우 여백 추가
        }
        
        // 즉시 구매 라벨 레이아웃
        immediateLabel.snp.makeConstraints {
            $0.top.equalTo(priceLabel.snp.bottom).offset(2)
            $0.leading.trailing.equalTo(priceLabel)
//            $0.bottom.equalToSuperview().offset(-8) // 셀 하단에 맞춤
        }
    }
}
