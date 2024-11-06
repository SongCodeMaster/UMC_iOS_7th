//
//  HomeCollectionViewCell3.swift
//  KREAM
//
//  Created by 송승윤 on 11/5/24.
//

import UIKit
import SnapKit
class HomeCollectionViewCell3: UICollectionViewCell {
    static let identifier = "HomeCollectionViewCell3"
    
    //이미지 뷰
    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
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
        
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(165)
        }
    }
}
