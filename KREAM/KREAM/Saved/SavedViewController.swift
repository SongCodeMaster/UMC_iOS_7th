//
//  SavedViewController.swift
//  KREAM
//
//  Created by 송승윤 on 10/3/24.
//

import UIKit

class SavedViewController: UIViewController {
    
    let data = dummySavedModel.SavedDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = savedView
        updateItemCount()
    }
    //SavedView 내부에 있는 tableView의 dataSource와 delegate 구현하기
    private lazy var savedView: SavedView = {
        let view = SavedView()
        view.tableView.dataSource = self
        view.tableView.delegate = self
        return view
    }()
    
    private func updateItemCount() {
        savedView.count.text = "전체 \(data.count)개"
    }
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SavedCell.identifier, for: indexPath) as? SavedCell else {
            return UITableViewCell()
        }
        cell.configure(model: data[indexPath.row])
        return cell
    }
}
