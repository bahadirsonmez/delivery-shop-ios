//
//  WalletViewController.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class SearchViewController: BaseViewController {
    var onLogout: (() -> Void)?
    
    var viewModel: SearchViewModel!
    
    // MARK: - Vars & Lets
    private let thisView: SearchView = SearchView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Arama"
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
        thisView.rowTapped = { row in
            switch row {
            case 0:
                print("")
            default:
                break
            }
        }
    }
    
    private func logoutAction() {
        self.onLogout?()
    }
    
    @objc func handleNotifications() {}
}
