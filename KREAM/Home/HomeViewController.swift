//
//  HomeViewController.swift
//  KREAM
//
//  Created by 송승윤 on 10/3/24.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDelegate {
    
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
        setupAction()
        setupDelegate()
    }
    
    //MARK: - Property
    private lazy var rootView: HomeView = {
        let rootView = HomeView()
        rootView.backgroundColor = .white
        rootView.onSearchBarTapped = { [weak self] in
            print("Search bar tapped!") // 디버깅용 로그
            self?.navigateToSearchViewController()
        }
        return rootView
    }()
    
    // HomeModel과 HomeModel2의 더미 데이터 배열
    private let homeItems = HomeModel.dummy()
    private let homeItems2 = HomeModel2.dummy()
    private let homeItems3 = HomeModel3.dummy()
    private func setupAction() {
        rootView.segmentedControl.addTarget(self,
                                            action: #selector(segmentedControlValueChanged(segment:)), for: .valueChanged)
            }
    
    private func setupDelegate() {
        rootView.homeCollectionView.dataSource = self
        rootView.HomeCollectionView2.dataSource = self
        rootView.HomeCollectionView3.dataSource = self
        
        rootView.homeCollectionView.delegate = self
        rootView.HomeCollectionView2.delegate = self
        rootView.HomeCollectionView3.delegate = self
    }
    
    // navigation 방식으로 검색뷰 화면 전환
    private func navigateToSearchViewController() {
        let searchViewController = SearchViewController()
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl){
        if segment.selectedSegmentIndex == 0 {
            rootView.homeCollectionView.isHidden = false
            rootView.HomeImageView.isHidden = false
            rootView.HomeCollectionView2.isHidden = false
            rootView.HomeCollectionView3.isHidden = false
            rootView.JustDroppedLabel.isHidden = false
            rootView.JustDroppedKorean.isHidden = false
            rootView.LookBookTitle.isHidden = false
            rootView.LooBookSubTitle.isHidden = false
        }
        else {
            rootView.homeCollectionView.isHidden = true
            rootView.HomeImageView.isHidden = true
            rootView.HomeCollectionView2.isHidden = true
            rootView.HomeCollectionView3.isHidden = true
            rootView.JustDroppedLabel.isHidden = true
            rootView.JustDroppedKorean.isHidden = true
            rootView.LookBookTitle.isHidden = true
            rootView.LooBookSubTitle.isHidden = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == rootView.HomeCollectionView2 && indexPath.item == 0 {
            let purchaseViewController = PurchaseViewController()
            if let navigationController = self.navigationController {
                purchaseViewController.hidesBottomBarWhenPushed = true
                navigationController.pushViewController(purchaseViewController, animated: true)
            } else {
                let navigationController = UINavigationController(rootViewController: purchaseViewController)
                navigationController.modalPresentationStyle = .fullScreen
                present(navigationController, animated: true, completion: nil)
            }
        }
    }
}


extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == rootView.homeCollectionView {
            return homeItems.count
        } else if collectionView == rootView.HomeCollectionView2 {
            return homeItems2.count
        } else if collectionView == rootView.HomeCollectionView3 {
            return homeItems3.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == rootView.homeCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as? HomeCollectionViewCell else {
                return UICollectionViewCell()
            }
            
            let item = homeItems[indexPath.row]
            cell.imageView.image = item.image
            cell.titleLabel.text = item.name
            
            return cell
            
        } else if collectionView == rootView.HomeCollectionView2 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell2.identifier, for: indexPath) as? HomeCollectionViewCell2 else {
                return UICollectionViewCell()
            }
            
            let item = homeItems2[indexPath.row]
            cell.imageView.image = item.image
            cell.brandLabel.text = item.brand
            cell.nameLabel.text = item.name
            cell.priceLabel.text = item.price
            cell.immediateLabel.text = item.immediate
            
            return cell
            
        } else if collectionView == rootView.HomeCollectionView3 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell3.identifier, for: indexPath) as? HomeCollectionViewCell3 else {
                return UICollectionViewCell()
            }
            
            let item = homeItems3[indexPath.row]
            cell.imageView.image = item.image
            
            return cell
        }
        
        return UICollectionViewCell()
    }
}
