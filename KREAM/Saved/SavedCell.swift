//
//  SavedCellTableViewCell.swift
//  KREAM
//
//  Created by 송승윤 on 10/11/24.
//

import UIKit
import SnapKit

class SavedCell: UITableViewCell {
    
    //ViewController에서 재사용 큐 함수 내부에서 정확한 식별자를 가져올수있음
    static let identifier = "SavedCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setViews()
        self.setConstraints()
    }
    
    //셀의 재사용 과정에서 호출된다.
    override func prepareForReuse() {
        super.prepareForReuse()
        self.savedImageView.image = nil
        self.savedName.text = nil
        self.savedImageDescription.text = nil
        self.savedPrice.text = nil
        self.savedCheck.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //TableViewCell에 UI 컴포넌트들 넣기
    private lazy var savedImageView: UIImageView = {
        let imageView = UIImageView()
        /* 이미지 뷰의 값은 뷰컨트롤러에서 작성*/
        // imageView.image = UIImage(named: "여기에 더마데이터 값")
        return imageView
    }()
    
    private lazy var savedName: UILabel = {
        let name = UILabel()
        name.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        name.textColor = UIColor.black
        return name
    }()
    
    private lazy var savedImageDescription: UILabel = {
        let descrip = UILabel()
        descrip.font = UIFont.systemFont(ofSize: 9, weight: .light)
        descrip.textColor = UIColor.lightGray
        return descrip
    }()
    
    private lazy var savedPrice: UILabel = {
        let price = UILabel()
        price.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        return price
    }()
    
    private lazy var savedCheck: UIImageView = {
        let check = UIImageView()
        return check
    }()
    
    private func setViews() {
        self.addSubview(savedImageView)
        self.addSubview(savedName)
        self.addSubview(savedImageDescription)
        self.addSubview(savedPrice)
        self.addSubview(savedCheck)
    }
    
    //셀기준으로 오토레이아웃 맞춰야합니다.
    private func setConstraints() {
        savedImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(13)
            make.left.equalToSuperview().offset(13)
            make.width.height.equalTo(72)
            make.bottom.lessThanOrEqualToSuperview().inset(13) // 하단 여백 추가 (이미지가 셀 안에 있도록)
        }
        savedName.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(13)
            make.leading.equalTo(savedImageView.snp.trailing).offset(13)
            make.trailing.equalToSuperview().offset(-16)
        }
        savedImageDescription.snp.makeConstraints{ make in
            make.top.equalTo(savedName).offset(19)
            make.leading.trailing.equalTo(savedName)
        }
        savedPrice.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(67)
            make.leading.equalToSuperview().offset(281)
        }
        savedCheck.snp.makeConstraints{ make in
            make.top.equalTo(savedName).offset(5)
            make.trailing.equalToSuperview().offset(-17)
        }
    }
    
    /* 그럼 위 코드에서 사진의 이미지 값과 이름 라벨의 텍스트 값은 ViewController에서 작성하게 된다 했습니다. 그럼 **ViewController가 Cell에 접근하여 Cell 내부 컴포넌트의 값을 바꿀 수 있도록** `public` 으로 공개된 함수가 필요합니다.
     즉, `UITableViewCell` 클래스 내부에 값을 설정하는 메서드를 만들어서 사용할 수 있도록 해야 합니다.*/
    
    // 값 설정 메서드 만들기
    public func configure(model: SavedModel) {
        self.savedImageView.image = UIImage(named: model.SavedImage)
        self.savedName.text = model.SavedName
        self.savedImageDescription.text = model.SavedImageDescription
        self.savedPrice.text = String(format: "%.2f", model.SavedPrice)
        self.savedCheck.image = UIImage(named: model.SavedCheck)
    }
}
