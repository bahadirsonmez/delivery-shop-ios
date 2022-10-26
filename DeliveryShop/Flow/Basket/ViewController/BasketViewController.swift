//
//  EventsViewController.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class BasketViewController: BaseViewController {
    var onCheckout: (() -> Void)?

    var viewModel: BasketViewModel!
    let thisView: BasketView = BasketView()
    lazy var navigationTitleImageView = UIImageView()
    var isFirstTime = true
    
    private lazy var navContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart-black"), for: .normal)
        return button
    }()
    
    private lazy var removeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "remove"), for: .normal)
        return button
    }()
    
    override func loadView() {
        super.loadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
        getBasket()
        bindActions()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    @objc func remove() {}
    
    private func setupUI() {
        self.view.addSubview(navContainer)
        navContainer.addSubviews(heartButton, removeButton)
        self.view.addSubview(thisView)
        
        
        let safeArea = self.view.safeAreaLayoutGuide
        navContainer.anchor(top: self.view.topAnchor,
                        leading: safeArea.leadingAnchor,
                        bottom: nil,
                        trailing: safeArea.trailingAnchor,
                        padding: .init(top: 44, left: 0, bottom: 0, right: 0),
                        size: .init(width: 0, height: 44))
        heartButton.anchor(top: nil,
                           leading: nil,
                           bottom: nil,
                           trailing: removeButton.leadingAnchor,
                           padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                           size: .init(width: 24, height: 24))
        heartButton.centerY(to: removeButton)
        removeButton.anchor(top: nil,
                           leading: nil,
                           bottom: nil,
                           trailing: safeArea.trailingAnchor,
                           padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                           size: .init(width: 24, height: 24))
        removeButton.centerY(to: navContainer)
        thisView.anchor(top: navContainer.bottomAnchor,
                        leading: safeArea.leadingAnchor,
                        bottom: safeArea.bottomAnchor,
                        trailing: safeArea.trailingAnchor,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func bindViewModel() {
        self.viewModel.isLoading = {(loading) in
            if loading {
                self.showActivityIndicator()
            }else {
                self.stopActivityIndicator()
            }
        }
    }
    
    private func getBasket() {
//        viewModel.getEvents {
//            self.eventView.loadView(withViewModel: self.viewModel)
//            let firstEventId = self.viewModel.events?.events?.first?.id
//            if let id = firstEventId {
//                self.getEventDetail(id)
//            }
//        } failure: { (error) in
//            self.handleError(error)
//        }
    }

    private func bindActions() {
        thisView.checkoutTapped = {
            self.onCheckout?()
        }
    }

}
