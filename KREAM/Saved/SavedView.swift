//
//  SavedView.swift
//  KREAM
//
//  Created by 송승윤 on 10/11/24.
//

import UIKit

class SavedView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.setViews()
        self.setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.text = "Saved"
        label.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        label.textColor = UIColor.black
        return label
    }()
    
    public lazy var count: UILabel = {
        let label = UILabel()
        label.text = "전체 10개"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = UIColor.darkGray
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let table = UITableView()
        table.register(SavedCell.self, forCellReuseIdentifier: SavedCell.identifier)
        table.separatorStyle = .singleLine
        table.rowHeight = UITableView.automaticDimension // 셀 높이 자동 조정
        table.estimatedRowHeight = 99
        return table
    }()
    
    private func setViews() {
        self.addSubview(title)
        self.addSubview(count)
        self.addSubview(tableView)
    }
    
    private func setConstraints() {
        title.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(61)
            make.leading.equalToSuperview().offset(10)
        }
        count.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(122)
            make.leading.equalToSuperview().offset(13)
            make.width.equalTo(55)
            make.height.equalTo(22)
        }
        tableView.snp.makeConstraints{ make in
            make.top.equalTo(title.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
        }
    }
}
