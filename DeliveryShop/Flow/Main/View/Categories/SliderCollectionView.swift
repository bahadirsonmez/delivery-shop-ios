//
//  SliderCollectionView.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class SliderSection: BaseCell, SetupCodeView {
    
    lazy var collectionView = SliderCollectionView()
    
    override func setupViews() {
        setupView()
    }
    func buildViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    func setupConstraints() {
        collectionView.fillSuperview()
    }
    
    func setupAdditionalConfiguration() {
    }
}

// MARK: - Header olarak kullacaksan "UICollectionReusableView" olmalı

class SliderCollectionView: UICollectionReusableView {
    var accountTapped : (() -> Void)? = nil
    var notificationTapped : (() -> Void)? = nil
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = Constants.Colors.backgroundColor
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        addSubview(collectionView)
        collectionView.fillSuperview()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SliderCell.self,
                                forCellWithReuseIdentifier: "sliderCellID")
    }
}

extension SliderCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCellID",
                                                      for: indexPath) as!  SliderCell
//        cell.setupCell(
//            Constants.CellTitles.menuTitles[indexPath.row],
//            menuImageName: Constants.CellImages.menuImages[indexPath.row]
//        )
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 40
        return CGSize(width: width, height: 180.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension SliderCollectionView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let centerX = self.collectionView.center.x
    
        for cell in self.collectionView.visibleCells {
        
            // coordinate of the cell in the viewcontroller's root view coordinate space
            let basePosition = cell.convert(CGPoint.zero, to: self)
            let cellCenterX = basePosition.x + self.collectionView.frame.size.height / 2.0
            
            let distance = abs(cellCenterX - centerX)
            
            let tolerance : CGFloat = 0.02
            var scale = 1.00 + tolerance - (( distance / centerX ) * 0.105)
            if(scale > 1.0){
                scale = 1.0
            }
            
            if(scale < 0.86){
                scale = 0.86
            }
            
            cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            let carouselCell = cell as! SliderCell
            
            carouselCell.alpha = changeSizeScaleToAlphaScale(scale)
        }
    }
    
    // for custom snap-to paging
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        var indexOfCellWithLargestWidth = 0
        var largestWidth : CGFloat = 1

        for cell in self.collectionView.visibleCells {
            if cell.frame.size.width > largestWidth {
                largestWidth = cell.frame.size.width
                if let indexPath = self.collectionView.indexPath(for: cell) {
                    indexOfCellWithLargestWidth = indexPath.item
                }
            }
        }

        collectionView.scrollToItem(at: IndexPath(item: indexOfCellWithLargestWidth, section: 0), at: .centeredHorizontally, animated: true)
    }
    
    // for when user scroll until finger is off the screen
    func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
        self.scrollViewDidEndDragging(scrollView, willDecelerate: true)
    }
    
    // map the scale of cell size to alpha of image view using formula below
    // https://stackoverflow.com/questions/5294955/how-to-scale-down-a-range-of-numbers-with-a-known-min-and-max-value
    func changeSizeScaleToAlphaScale(_ x : CGFloat) -> CGFloat {
        let minScale : CGFloat = 0.86
        let maxScale : CGFloat = 1.0
        
        let minAlpha : CGFloat = 0.25
        let maxAlpha : CGFloat = 1.0
        
        return ((maxAlpha - minAlpha) * (x - minScale)) / (maxScale - minScale) + minAlpha
    }
}


