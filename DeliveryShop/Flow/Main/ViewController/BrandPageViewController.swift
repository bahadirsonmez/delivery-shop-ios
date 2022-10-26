//
//  BrandPageViewController.swift
//  DeliveryShop
//
//  Created by ssaylanc on 5.02.2021.
//

import UIKit

class BrandPageViewController: BaseViewController {
    var onLogout: (() -> Void)?
    
    var viewModel: MainViewModel!
    
    // MARK: - Vars & Lets
    private let thisView: HomeView = HomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "HamurShop"
        let add = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(handleNotifications))
        navigationItem.rightBarButtonItems = [add]
    }
    
    private func setupUI() {
        self.view.addSubview(thisView)
        thisView.fillSuperview()
        self.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = Constants.Colors.backgroundColor
    }
    
    private func bindActions() {
        
    }
    
    private func logoutAction() {
        self.onLogout?()
    }
    
    @objc func handleNotifications() {}
}
