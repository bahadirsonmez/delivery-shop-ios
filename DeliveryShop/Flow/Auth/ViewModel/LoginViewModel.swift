//
//  LoginViewModel.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Foundation

class LoginViewModel: NSObject {
    // MARK: - Vars & lets
    
    //private let loginRequest: LoginRequest
    private let manager: LoginAPIManager
    var isLoading: ((Bool) -> ())?
    var loginResponse: LoginResponse?
    
    func logiWithEmail(_ email: String, password: String, success: @escaping () -> Void, failure: @escaping (APIError) -> Void) {
        let parameters: [String: Any] = ["email": email,
                                         "password": password]
        self.isLoading?(true)
        manager.call(router: LoginRouter.login(parameters: parameters)) {(result: Result<LoginResponse, APIError>) in
            switch result {
            case .success(let data):
                self.isLoading?(false)
                self.loginResponse = data
                let accessToken =  data.token
                Account.sharedAccount.setAccessToken(accessToken)
                success()
            case .failure(let error):
                self.isLoading?(false)
                failure(error)
            }
        }
    }
    
//    func passwordReset(_ email: String, success: @escaping () -> Void, failure: @escaping (APIError) -> Void) {
//        let parameters: [String: Any] = ["email": email]
//        self.isLoading?(true)
//        manager.call(router: LoginRouter.passwordReset(parameters: parameters)) {(result: Result<ResetResponse, APIError>) in
//            switch result {
//            case .success(_):
//                self.isLoading?(false)
//                success()
//            case .failure(let error):
//                self.isLoading?(false)
//                failure(error)
//            }
//        }
//    }

    // MARK: - Init
    init(manager: LoginAPIManager) {
        self.manager = manager
        super.init()
    }
}

