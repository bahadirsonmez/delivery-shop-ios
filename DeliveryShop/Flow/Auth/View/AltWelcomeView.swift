//
//  AltWelcomeView.swift
//  DeliveryShop
//
//  Created by Bahadir Sonmez on 10.02.2021.
//
import UIKit

class AltWelcomeView: BaseView {
    var skipTapped : (()->Void)?
    private var page: Int = 0
    private var totalPage: Int = 4

    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = Constants.Fonts.bold24
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Your online shopping \nstore"
        return label
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsVerticalScrollIndicator = false
        cv.showsHorizontalScrollIndicator = false
        //cv.backgroundColor = UIColor(rgba: "#f1eee4")
        cv.backgroundColor = .white
        return cv
    }()
    lazy var startButton: UIButton = {
        let button = UIButton()
        button.apply(style: .blackColor)
        button.setTitle("Start now", for: .normal)
        button.addTarget(self, action: #selector(didTapStart), for: .touchUpInside)
        return button
    }()
    lazy var infoView1: WelcomePageInfoView = {
        let view = WelcomePageInfoView()
        return view
    }()
    lazy var infoView2: WelcomePageInfoView = {
        let view = WelcomePageInfoView()
        return view
    }()

    @objc func didTapStart() {
        self.skipTapped?()
    }

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()

    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func loadView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SliderCell.self,
                                forCellWithReuseIdentifier: "sliderCellId")
        collectionView.reloadData()
        infoView1.loadView(title: "Better shopping experience",
                           subtitle: "Better mobil shopping apps",
                           image: UIImage(named: "shopping-cart")!)
        infoView2.loadView(title: "Better shopping experience",
                           subtitle: "Better mobil shopping apps",
                           image: UIImage(named: "shopping-cart")!)
    }
}

extension AltWelcomeView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(collectionView, title, infoView1, infoView2, startButton)
    }

    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        title.anchor(
            top: safeArea.topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            padding: .init(top: 35, left: 20, bottom: 10, right: 20)
        )
        collectionView.anchor(
            top: title.bottomAnchor,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: .init(top: 25, left: 0, bottom: 0, right: 0),
            size: .init(width: 250, height: 260)
        )
        collectionView.centerX(to: self)
        infoView1.anchor(
            top: nil,
            leading: nil,
            bottom: infoView2.topAnchor,
            trailing: nil,
            padding: .init(top: 0, left: 60, bottom: 25, right: 60),
            size: .init(width: 280, height: 45)
        )
        infoView1.centerX(to: self)
        infoView2.anchor(
            top: nil,
            leading: nil,
            bottom: startButton.topAnchor,
            trailing: nil,
            padding: .init(top: 0, left: 60, bottom: 55, right: 60),
            size: .init(width: 280, height: 45)
        )
        infoView2.centerX(to: self)
        startButton.anchor(
            top: nil,
            leading: nil,
            bottom: safeArea.bottomAnchor,
            trailing: nil,
            padding: .init(top: 0, left: 0, bottom: 10, right: 0),
            size: .init(width: 230, height: 45)
        )
        startButton.centerX(to: self)
    }

    func setupAdditionalConfiguration() {
    }
}

extension AltWelcomeView: UICollectionViewDelegate, UICollectionViewDataSource,
                      UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return totalPage
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCellId", for: indexPath) as! SliderCell
        cell.title.isHidden = true
//        cell.backgroundColor = .blue
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 200, height: 260)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return collectionView.frame.width - 200
    }
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        self.bannerViewTapped?(indexPath.row)
//    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension AltWelcomeView : UIScrollViewDelegate {
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

        page = indexOfCellWithLargestWidth
//        self.fadeInAndOutAnimator(title, duration: 0.5) { }
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




