import UIKit
import Then
import SnapKit

class HomeView: UIView, UISearchBarDelegate {
    
    public var onSearchBarTapped: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
        setupSeparators()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // UIScrollView 추가
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = true
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .white
    }
    
    // contentView 추가
    private let contentView = UIView()
    
    // segmentedControl 설정
    let segmentedControl = UISegmentedControl(items: ["추천","랭킹","발매정보","럭셔리","남성","여성"]).then {
        $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
        $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
        $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
        $0.selectedSegmentIndex = 0
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .light)
            ],
            for: .normal
        )
        $0.setTitleTextAttributes(
            [
                NSAttributedString.Key.foregroundColor: UIColor.black,
                .font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ],
            for: .selected
        )
    }
    
    // 첫번째 CollectionView 레이아웃 설정
    let homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 61, height: 81)
        $0.minimumInteritemSpacing = 9  // 가로 간격
        $0.minimumLineSpacing = 20      // 세로 간격
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = false
        $0.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
    }
    
    //두번째 콜렉션뷰 세팅
    let HomeCollectionView2 = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 142, height: 237)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal // 가로 스크롤 설정
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(HomeCollectionViewCell2.self,forCellWithReuseIdentifier: HomeCollectionViewCell2.identifier)
    }
    
    //세번째 콜렉션뷰 세팅
    let HomeCollectionView3 = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.estimatedItemSize = .init(width: 124, height: 165)
        $0.minimumInteritemSpacing = 8
        $0.scrollDirection = .horizontal //가로스크롤 설정
    }).then {
        $0.backgroundColor = .clear
        $0.isScrollEnabled = true
        $0.register(HomeCollectionViewCell3.self, forCellWithReuseIdentifier: HomeCollectionViewCell3.identifier)
    }
    
    // 이미지 뷰
    public lazy var HomeImageView = UIImageView().then {
        $0.image = UIImage(named: "HomeImage")
        $0.contentMode = .scaleToFill
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 알림 이미지 뷰
    public lazy var alertImageView = UIImageView().then {
        $0.image = UIImage(named: "alert")
        $0.contentMode = .scaleAspectFit
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //MARK: -
    
    /// 상단 검색 바
    public lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .clear
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 12
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
        
        /* 돋보기 아이콘 및 여백 제거 */
        searchBar.searchTextField.leftView = nil
        return searchBar
    }()
    
    // Just Dropped 라벨 설정
    public lazy var JustDroppedLabel = UILabel().then{
        $0.text = "Just Dropped"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 발매상품 라벨
    public lazy var JustDroppedKorean = UILabel().then{
        $0.text = "발매 상품"
        $0.font = .systemFont(ofSize: 10, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //본격 한파대비 라벨
    public lazy var LookBookTitle = UILabel().then {
        $0.text = "본격 한파대비! 연말 필수템 모음"
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    //본격 한파대비 서브라벨
    public lazy var LooBookSubTitle = UILabel().then {
        $0.text = "#해피홀리룩챌린지"
        $0.font = .systemFont(ofSize: 13, weight: .light)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    // 구분선 추가
    private func setupSeparators() {
        // 구분선을 추가할 뷰와 오프셋을 배열로 관리
        let separatorPositions: [(below: UIView, offset: CGFloat)] = [
            (homeCollectionView, 30),
            (HomeCollectionView2, 30)
        ]
        
        separatorPositions.forEach { position in
            addSeparatorLine(below: position.below, offset: position.offset)
        }
    }
    
    // 실선 뷰 추가 헬퍼 메서드
    private func addSeparatorLine(below view: UIView, offset: CGFloat) {
        let separatorLine = UIView()
        separatorLine.backgroundColor = UIColor.lightGray.withAlphaComponent(0.3)
        contentView.addSubview(separatorLine)
        
        separatorLine.snp.makeConstraints{
            $0.top.equalTo(view.snp.bottom).offset(offset)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    private func setupView() {
        // scrollView와 contentView 추가
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        // 기존의 모든 콘텐츠를 contentView에 추가
        [segmentedControl, alertImageView, homeCollectionView, HomeImageView, searchBar,JustDroppedLabel,JustDroppedKorean,HomeCollectionView2,HomeCollectionView3,LookBookTitle,LooBookSubTitle].forEach {
            contentView.addSubview($0)
        }
        
        // scrollView 레이아웃 설정
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        // contentView 레이아웃 설정 (scrollView의 크기에 맞추어 조정)
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
        }
        
        // 개별 콘텐츠의 레이아웃 설정
        searchBar.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(6)
            $0.leading.equalTo(contentView).offset(16)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        
        alertImageView.snp.makeConstraints {
            $0.top.equalTo(contentView).offset(14)
            $0.trailing.equalTo(contentView).offset(-16)
            $0.width.height.equalTo(24)
        }
        
        segmentedControl.snp.makeConstraints {
            $0.top.equalTo(searchBar.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.height.equalTo(60)
        }
        
        HomeImageView.snp.makeConstraints {
            $0.top.equalTo(segmentedControl.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(336)
            $0.width.equalTo(374)
        }
        
        homeCollectionView.snp.makeConstraints {
            $0.top.equalTo(HomeImageView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(16)
            $0.height.equalTo(182)
        }
        JustDroppedLabel.snp.makeConstraints{
            $0.top.equalTo(homeCollectionView.snp.bottom).offset(50)
            $0.leading.equalToSuperview().inset(16)
        }
        JustDroppedKorean.snp.makeConstraints{
            $0.top.equalTo(JustDroppedLabel.snp.bottom).offset(4)
            $0.leading.equalToSuperview().offset(16)
        }
        
        HomeCollectionView2.snp.makeConstraints{
            $0.top.equalTo(JustDroppedKorean.snp.bottom).offset(14)
            $0.leading.equalToSuperview().offset(16)
            $0.height.equalTo(237)
            $0.width.equalTo(442) // 제약조건 너비 추가
        }
        
        LookBookTitle.snp.makeConstraints{
            $0.top.equalTo(HomeCollectionView2.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
        
        LooBookSubTitle.snp.makeConstraints{
            $0.top.equalTo(LookBookTitle.snp.bottom).offset(4)
            $0.leading.trailing.equalTo(LookBookTitle)
        }
        
        HomeCollectionView3.snp.makeConstraints{
            $0.top.equalTo(LooBookSubTitle.snp.bottom).offset(14)
            $0.leading.equalTo(LooBookSubTitle)
            $0.width.equalTo(388)
            $0.height.equalTo(165)
            $0.bottom.equalToSuperview().offset(-30)
        }
        //        $0.bottom.equalToSuperview().offset(-16) // 스크롤 가능하도록 하단에 여백 추가
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        print("SearchBar text did begin editing")
        onSearchBarTapped?()
    }
    
}
