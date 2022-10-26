//
//  WelcomeViewController.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import UIKit

class WelcomeViewController: BaseViewController {
    var onLogin: (() -> Void)?
    var onLogout: (() -> Void)?
    var onSkip: (() -> Void)?
    var onProfileDetail: (() -> Void)?
    
    var viewModel: AccountViewModel!
    
    // MARK: - Vars & Lets
    private let thisView: AltWelcomeView = AltWelcomeView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindActions()
        navigationBarSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.navigationController?.navigationBar.isHidden = true
        self.navigationController?.navigationBar.isHidden = false
//        self.navigationController?.navigationBar.topItem?.title = "Welcome"
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupUI() {
        self.view.addSubview(thisView)
        thisView.fillSuperview()
        thisView.loadView()
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.backgroundColor = Constants.Colors.backgroundColor
    }
    
    private func bindActions() {
        thisView.skipTapped = {
            self.onSkip?()
        }
    }
    
    private func logoutAction() {
        self.onLogout?()
    }
    
    @objc func handleNotifications() {}

    private func navigationBarSetup() {
        self.navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "help")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(didTapHelp))
        self.navigationController?.navigationBar.hideHairline()
    }

    @objc func didTapHelp() { }

}
