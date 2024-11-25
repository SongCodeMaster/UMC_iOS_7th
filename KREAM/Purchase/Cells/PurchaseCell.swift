//
//  BuyCollectionViewCell.swift
//  KREAM
//
//  Created by 송승윤 on 11/15/24.
//

import UIKit
import SnapKit

class PurchaseCell: UICollectionViewCell {
    
    static let identifier = "PurchaseCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        self.imageView.image = nil
    }
    
    //셀 내부 이미지 버튼
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private func constraints() {
        self.addSubview(imageView)
        
        imageView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    // 뷰 컨트롤러에서 셀 접근하여 데이터 할당해주기
    // - Parameter model: RequiredCellProtocol을 상속 받는 모델 데이터 입력!
    public func configure(model: any RequiredCellProtocol) {
        // as를 통해 RequredCellProtocol을 상속 받는 모델이면서, 해당 셀에서 사용할 실제 모델 할당
        guard let purchaseData = model as? PurchaseModel else {return}
        self.imageView.image = UIImage(named: purchaseData.imageView)
    }
}
