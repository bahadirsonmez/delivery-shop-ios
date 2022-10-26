//
//  SubcategoriesViewController.swift
//  DeliveryShop
//
//  Created by ssaylanc on 6.02.2021.
//

import UIKit

class SubcategoriesViewController: BaseViewController {
    var onBack: (() -> Void)?
    
    // MARK: - Vars & Lets
    private let thisView: CategoriesView = CategoriesView()
    
    private lazy var navContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var navTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = Constants.Colors.mainTextColor
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = ""
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Back Arrow"), for: .normal)
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var searchButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Search"), for: .normal)
        button.addTarget(self, action: #selector(searchAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var filterButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Filter"), for: .normal)
        button.addTarget(self, action: #selector(filterAction), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.view.addSubview(navContainer)
        navContainer.addSubviews(backButton, navTitle, searchButton, filterButton)
        self.view.addSubview(thisView)
        navContainer.anchor(top: self.view.topAnchor,
                            leading: safeArea.leadingAnchor,
                            bottom: nil,
                            trailing: safeArea.trailingAnchor,
                            padding: .init(top: 44, left: 0, bottom: 0, right: 0),
                            size: .init(width: 0, height: 44))
        navTitle.anchor(top: nil, leading: nil, bottom: nil, trailing: nil)
        navTitle.centerView(to: navContainer)
        backButton.anchor(top: nil,
                          leading: navContainer.leadingAnchor,
                          bottom: nil,
                          trailing: nil,
                          padding: .init(top: 0, left: 20, bottom: 0, right: 0),
                          size: .init(width: 24, height: 24))
        backButton.centerY(to: navContainer)
        filterButton.anchor(top: nil,
                            leading: nil,
                            bottom: nil,
                            trailing: searchButton.leadingAnchor,
                            padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                            size: .init(width: 24, height: 24))
        filterButton.centerY(to: searchButton)
        searchButton.anchor(top: nil,
                            leading: nil,
                            bottom: nil,
                            trailing: safeArea.trailingAnchor,
                            padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                            size: .init(width: 24, height: 24))
        searchButton.centerY(to: navContainer)
        thisView.anchor(top: navContainer.bottomAnchor,
                        leading: safeArea.leadingAnchor,
                        bottom: safeArea.bottomAnchor,
                        trailing: safeArea.trailingAnchor,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func bindActions() {
        
    }
    
    @objc func backAction() {
        self.onBack?()
    }
    
    @objc func searchAction() {
    }
    
    @objc func filterAction() {
    }
}
