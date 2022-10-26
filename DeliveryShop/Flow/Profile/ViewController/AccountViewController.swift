//
//  AccountViewController.swift
//  bolomio
//
//  Created by ssaylanc on 13.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import UIKit

class AccountViewController: BaseViewController {
    var onLogout: (() -> Void)?
    var onProfileDetail: (() -> Void)?
    
    var viewModel: AccountViewModel!
    
    // MARK: - Vars & Lets
    private let thisView: AccountView = AccountView()
    
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
        label.text = "Account"
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Edit"), for: .normal)
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
        //self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        let safeArea = self.view.safeAreaLayoutGuide
        self.view.addSubview(navContainer)
        navContainer.addSubviews(navTitle, editButton)
        self.view.addSubview(thisView)
        navContainer.anchor(top: self.view.topAnchor,
                        leading: safeArea.leadingAnchor,
                        bottom: nil,
                        trailing: safeArea.trailingAnchor,
                        padding: .init(top: 44, left: 0, bottom: 0, right: 0),
                        size: .init(width: 0, height: 44))
        navTitle.anchor(top: nil, leading: nil, bottom: nil, trailing: nil)
        navTitle.centerView(to: navContainer)
        editButton.anchor(top: nil,
                           leading: nil,
                           bottom: nil,
                           trailing: safeArea.trailingAnchor,
                           padding: .init(top: 0, left: 0, bottom: 0, right: 20),
                           size: .init(width: 24, height: 24))
        editButton.centerY(to: navContainer)
        thisView.anchor(top: navContainer.bottomAnchor,
                        leading: safeArea.leadingAnchor,
                        bottom: safeArea.bottomAnchor,
                        trailing: safeArea.trailingAnchor,
                        padding: .init(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    private func bindActions() {
//        thisView.rowTapped = {[weak self] row in
//            guard let self = self else {return}
//            switch row {
//            case 0:
//                self.logoutAction()
//                //self.onProfileDetail?()
////            case 1:
////                self.logoutAction()
//            default:
//                break
//            }
//        }
    }
    
    private func logoutAction() {
        self.onLogout?()
    }
    
    @objc func handleNotifications() {}
}
