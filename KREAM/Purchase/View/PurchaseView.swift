//
//  BuyView.swift
//  KREAM
//
//  Created by 송승윤 on 11/15/24.
//

import UIKit
import Then
import SnapKit

class PurchaseView: UIView {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
        
    }
    
    public lazy var BuyImageView = UIImageView().then {
        $0.image = UIImage(named: "BuyImage1")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var PurchaseLabel = UILabel().then {
        $0.text = "즉시 구매가"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var PurchasePrice = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 20, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var ProductTitle = UILabel().then {
        $0.text = "Matin Kim Logo Coating Jumper"
        $0.font = .systemFont(ofSize: 16, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    public lazy var ProductTitleKorean = UILabel().then {
        $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
        $0.font = .systemFont(ofSize: 12, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    // 구매 버튼 스택뷰 내부 라벨
    private lazy var buyPriceLabel = UILabel().then {
        $0.text = "228,000원"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var buyDescriptionLabel = UILabel().then {
        $0.text = "즉시 구매"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
    }
    
    
    private lazy var buyAdditionalLabel = UILabel().then {
        $0.text = "배송비 포함"
        $0.font = .systemFont(ofSize: 8, weight: .light)
        $0.textColor = .white
    }
    
    // 판매 버튼 스택뷰 내부 라벨
    private lazy var sellPriceLabel = UILabel().then {
        $0.text = "220,000원"
        $0.font = .systemFont(ofSize: 14, weight: .bold)
        $0.textColor = .white
    }
    
    private lazy var sellDescriptionLabel = UILabel().then {
        $0.text = "즉시 판매"
        $0.font = .systemFont(ofSize: 10, weight: .regular)
        $0.textColor = .white
    }
    
    private lazy var sellAdditionalLabel = UILabel().then {
        $0.text = "배송비 포함"
        $0.font = .systemFont(ofSize: 8, weight: .light)
        $0.textColor = .white
    }
    
    // 구매 버튼 스택뷰
    private lazy var buyStackView = UIStackView(arrangedSubviews: [buyPriceLabel, buyDescriptionLabel, buyAdditionalLabel]).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
    }
    
    public lazy var BuyBtn = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(hex: "EF6254") // 피그마 빨간색
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = true
        $0.addSubview(buyStackView)
        buyStackView.snp.makeConstraints{ $0.edges.equalToSuperview().inset(8)}
    }
    
    // 판매 버튼 스택뷰
    private lazy var sellStackView = UIStackView(arrangedSubviews: [sellPriceLabel, sellDescriptionLabel, sellAdditionalLabel]).then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 4
    }
    
    public lazy var SellBtn = UIButton(type: .system).then {
        $0.backgroundColor = UIColor(hex: "#41B97A") // 피그마 초록색
        $0.layer.cornerRadius = 10
        $0.isUserInteractionEnabled = true
        $0.addSubview(sellStackView)
        sellStackView.snp.makeConstraints { $0.edges.equalToSuperview().inset(8) }
    }
    
    // 하단 백그라운드 뷰 내부의 태그 버튼
    private lazy var tagBtn: UIButton = {
        let btn = UIButton()
        var configuration = UIButton.Configuration.plain()
        configuration.image = UIImage(named: "notTag")
        configuration.imagePlacement = .top
        configuration.imagePadding = 1
        
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
        
        configuration.attributedTitle = AttributedString("2,122", attributes: AttributeContainer([.foregroundColor: UIColor.black,.font: UIFont.systemFont(ofSize: 12,weight: .regular)]))
        
        btn.configuration = configuration
        return btn
    }()
    
    // StackView for buttons
    private lazy var buttonStackView = UIStackView(arrangedSubviews: [tagBtn,BuyBtn, SellBtn]).then {
        $0.axis = .horizontal
        $0.alignment = .center
        $0.distribution = .fillEqually
        $0.spacing = 8
    }
    
    // CollectionView setting
    let productCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then{
        $0.estimatedItemSize = .init(width: 53, height: 53) // 레이아웃설정
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal // 가로스크롤 설정
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(PurchaseCell.self, forCellWithReuseIdentifier: PurchaseCell.identifier) //재사용여부
    }
    
    private func setupView() {
        [BuyImageView, productCollectionView, PurchaseLabel, PurchasePrice, ProductTitle, ProductTitleKorean,buttonStackView].forEach{
            addSubview($0)
        }
        
        
        // ImageLayout
        BuyImageView.snp.makeConstraints{
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.width.height.equalTo(374)
        }
        
        productCollectionView.snp.makeConstraints{
            $0.top.equalTo(BuyImageView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(60)
        }
        
        PurchaseLabel.snp.makeConstraints{
            $0.top.equalTo(productCollectionView.snp.bottom).offset(23)
            $0.leading.equalToSuperview().offset(16)
        }
        
        PurchasePrice.snp.makeConstraints{
            $0.top.equalTo(PurchaseLabel.snp.bottom).offset(4)
            $0.leading.equalTo(PurchaseLabel)
        }
        
        ProductTitle.snp.makeConstraints{
            $0.top.equalTo(PurchasePrice.snp.bottom).offset(18)
            $0.leading.equalTo(PurchaseLabel)
        }
        
        ProductTitleKorean.snp.makeConstraints{
            $0.top.equalTo(ProductTitle.snp.bottom).offset(6)
            $0.leading.equalTo(PurchaseLabel)
        }
        buttonStackView.snp.makeConstraints{
            $0.top.equalTo(ProductTitleKorean.snp.bottom).offset(62)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.height.equalTo(40)
        }
    }
}




extension UIColor {
    // Hex 값으로 UIColor 생성
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
