//
//  BuyViewController.swift
//  KREAM
//
//  Created by 송승윤 on 11/15/24.
//

import UIKit

class PurchaseViewController: UIViewController {
    
    let data = PurchaseData.purchaseData
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    override func loadView() {
        self.view = purchaseView
    }
    
    // property
    private lazy var purchaseView: PurchaseView = {
        let view = PurchaseView()
        view.productCollectionView.delegate = self
        view.productCollectionView.dataSource = self
        return view
    }()
    
    private func setupNavigationBar() {
        // 뒤로가기 버튼 추가
        let backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(dismissViewController))
        navigationItem.leftBarButtonItem = backButton
    }
    @objc private func dismissViewController() {
        dismiss(animated: true, completion: nil)
    }
}


extension PurchaseViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PurchaseCell.identifier, for: indexPath) as? PurchaseCell else {return UICollectionViewCell() }
        cell.configure(model: data[indexPath.row])
        
        return cell
    }
    
    // 하나의 상품에 대해 다른 색사의 상품 셀을 선택했을때, 대표 사진 및. 설명 텍스트 부분 바뀌도록 설정하는 함수
    private func updateSelectedImage(for indexPath: IndexPath) {
        purchaseView.BuyImageView.image = UIImage(named: data[indexPath.item].imageView)
        purchaseView.ProductTitleKorean.text = data[indexPath.item].productName
    }
    
    //collectionView 내부 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
    }
    
    // 컬렉션 뷰의 아이템을 클릭했을때 눌렸을때 처리 지정
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        updateSelectedImage(for: indexPath)
    }
}
