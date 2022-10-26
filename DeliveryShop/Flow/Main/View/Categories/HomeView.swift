//
//  HomeView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

// 1. Slider
// 2. New Arrivals
// 3. What's Trending
// 4. History

class HomeView: UIView {
    private let spacing: CGFloat = 20.0
    
    var safeArea = UILayoutGuide()
    let productCellHeight: CGFloat = 235.0
    let cellHeight: CGFloat = 90.0
    let headerHeight: CGFloat = 240.0
    let swipeCellId = "swipeCellId"
    let sliderCellId = "sliderCellId"
    let newArrivalsCellId = "newArrivalsCellId"
    let trendingCellId = "trendingCellId"
    let historyHeaderId = "historyHeaderId"
    let historyCellId = "historyCellId"

    private lazy var swipeMenu: SwipeMenu = SwipeMenu()
    private lazy var sliderView: SliderCollectionView = SliderCollectionView()
    private lazy var newArrivals: NewArrivalsView = NewArrivalsView()

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
//    func loadView() {
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.register(SliderSection.self,
//                                forCellWithReuseIdentifier: sliderCellId)
//        collectionView.register(NewArrivalsSection.self,
//                                forCellWithReuseIdentifier: newArrivalsCellId)
//        collectionView.register(TrendingSection.self,
//                                forCellWithReuseIdentifier: trendingCellId)
//    }
    
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .clear
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented")
        
    }
}

extension HomeView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: swipeCellId,
                                                          for: indexPath) as!  SwipeMenuSection
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: sliderCellId,
                                                          for: indexPath) as!  SliderSection
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newArrivalsCellId,
                                                          for: indexPath) as!  NewArrivalsSection
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: trendingCellId,
                                                          for: indexPath) as!  TrendingSection
            return cell
        case 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: historyCellId,
                                                          for: indexPath) as!  HistorySection
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: newArrivalsCellId,
                                                          for: indexPath) as!  NewArrivalsSection
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width
        switch indexPath.row {
        case 0:
            return CGSize(width: width, height: 52.0)
        case 1:
            return CGSize(width: width, height: 200.0)
        case 2:
            return CGSize(width: width, height: 570.0)
        case 3:
            return CGSize(width: width, height: 280.0)
        case 4:
            return CGSize(width: width, height: 315.0)
        default:
            return CGSize(width: width, height: 570.0)
        }
    }
}

extension HomeView: SetupCodeView {
    func buildViewHierarchy() {
        self.addSubviews(collectionView)
    }
    
    func setupConstraints() {
        safeArea = self.safeAreaLayoutGuide
        collectionView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SwipeMenuSection.self,
                                forCellWithReuseIdentifier: swipeCellId)
        collectionView.register(SliderSection.self,
                                forCellWithReuseIdentifier: sliderCellId)
        collectionView.register(NewArrivalsSection.self,
                                forCellWithReuseIdentifier: newArrivalsCellId)
        collectionView.register(TrendingSection.self,
                                forCellWithReuseIdentifier: trendingCellId)
        collectionView.register(VerticalSectionHeaderCell.self,
                                forCellWithReuseIdentifier: historyHeaderId)
        collectionView.register(HistorySection.self,
                                forCellWithReuseIdentifier: historyCellId)
    }
}
