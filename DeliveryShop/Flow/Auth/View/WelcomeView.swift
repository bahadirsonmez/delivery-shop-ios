//
//  WelcomeView.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//
import UIKit

class WelcomeView: BaseView {
    var skipTapped : (()->Void)?
    private var page: Int = 0
    private var totalPage: Int = 4

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

    lazy var skipButton: UIButton = {
        let button = UIButton()
        button.apply(style: .grayColor)
        button.setTitle("Skip", for: .normal)
        button.addTarget(self, action: #selector(didTapSkip), for: .touchUpInside)
        return button
    }()

    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = Constants.Fonts.semibold24
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "New collection"
        return label
    }()

    lazy var subTitle: UILabel = {
        let label = UILabel()
        label.textColor = Constants.Colors.mainTextColor
        label.font = Constants.Fonts.light16
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text =
            """
            A shower of patterns,
            new inspirations and intriguing details
            for women’s clothing.
            """
        return label
    }()


    @objc func didTapSkip() {
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
    }
}

extension WelcomeView: SetupCodeView {
    func buildViewHierarchy() {
        addSubviews(collectionView, title, subTitle, skipButton)
    }

    func setupConstraints() {
        let safeArea = self.safeAreaLayoutGuide
        collectionView.anchor(
            top: safeArea.topAnchor,
            leading: leadingAnchor,
            bottom: nil,
            trailing: trailingAnchor,
            size: .init(width: 0, height: 460)
        )
        title.anchor(
            top: nil,
            leading: leadingAnchor,
            bottom: subTitle.topAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 0, left: 20, bottom: 10, right: 20)
        )
        subTitle.anchor(
            top: title.bottomAnchor,
            leading: leadingAnchor,
            bottom: skipButton.topAnchor,
            trailing: trailingAnchor,
            padding: .init(top: 20, left: 20, bottom: 50, right: 20)
        )
        skipButton.anchor(
            top: nil,
            leading: nil,
            bottom: safeArea.bottomAnchor,
            trailing: nil,
            size: .init(width: 105, height: 45)
        )
        skipButton.centerX(to: self)
    }

    func setupAdditionalConfiguration() {
    }
}

extension WelcomeView: UICollectionViewDelegate, UICollectionViewDataSource,
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
        return .init(width: frame.width - 40, height: 460)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
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

extension WelcomeView : UIScrollViewDelegate {
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
        self.changeButtonTitleIfLastPage()
        self.fadeInAndOutAnimator(title, subTitle, duration: 0.5) { }
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

    func changeButtonTitleIfLastPage() {
        if skipButton.currentTitle == "Continue" {
            return
        }
        if page == totalPage - 1 {
            fadeInAndOutAnimator(skipButton.titleLabel!, duration: 0.5) {
                self.skipButton.setTitle("Continue", for: .normal)
            }
        }
    }
}




