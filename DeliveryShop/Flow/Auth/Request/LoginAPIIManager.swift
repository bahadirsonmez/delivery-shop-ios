//
//  LoginAPIIManager.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//

import Alamofire
import Foundation

class LoginAPIManager {
    
    // MARK: - Vars & Lets
    private let retrier: APIManagerRetrier
    private let sessionManager: Session
    
    private func parseAPIResponse<T>(data: AFDataResponse<Any>?, handler: @escaping (Swift.Result<T, APIError>) -> Void) where T: Codable {
        do {
            guard let jsonData = data?.data else {
                throw APIError(0, data, "JSON Boş".localized())
            }
            let result = try JSONDecoder().decode(T.self, from: jsonData)
            handler(.success(result))
        } catch {
            guard let decodingError = error as? DecodingError else {
                return
            }
            switch decodingError {
            case let .typeMismatch(object, context):
                handler(.failure(APIError(1, nil, "\(object) " + context.debugDescription)))
            case let .dataCorrupted(context):
                handler(.failure(APIError(2, nil, context.debugDescription)))
            case let .keyNotFound(key, context):
                handler(.failure(APIError(3, nil, "\(key) " + context.debugDescription)))
            default:
                break
            }
        }
    }
    
    private func parseAPIError(data: AFDataResponse<Any>?, handler: @escaping (Swift.Result<APIError, APIError>) -> Void) {
        do {
            guard let jsonData = data?.data else {
                throw APIError(0, data, "Error JSON Boş".localized())
            }
            let result = try JSONDecoder().decode(SkyErrorModel.self, from: jsonData)
            let statusCode = data?.response?.statusCode
            var detail = ""
            if let message = result.detail {
                detail = message
            }else {
                if statusCode == 456 {
                    detail = "Constants.Alerts.wrongVoucher"
                }
            }
            //result.error = statusCode
            handler(.failure(APIError(0, nil, detail)))
        } catch {
            guard let decodingError = error as? DecodingError else {
                return
            }
            switch decodingError {
            case let .typeMismatch(object, context):
                handler(.failure(APIError(1, nil, "\(object) " + context.debugDescription)))
            case let .dataCorrupted(context):
                handler(.failure(APIError(2, nil, context.debugDescription)))
            case let .keyNotFound(key, context):
                handler(.failure(APIError(3, nil, "\(key) " + context.debugDescription)))
            default:
                break
            }
            
            if let skyError = error as? APIError {
                switch skyError.data?.error {
                case .sessionTaskFailed(error: _):
                    handler(.failure(APIError(-1, nil, "İstek zaman aşımına uğradı.".localized())))
                case .requestRetryFailed(retryError: _, originalError: _):
                    handler(.failure(APIError(-2, nil, "Yeniden deneme hatası".localized())))
                default:
                    handler(.failure(APIError(-100, nil, "Hata oluştu, tekrar deneyin.".localized())))
                }
            }
        }
    }
    
    func call<T>(router: LoginRouter, handler: @escaping (Swift.Result<T, APIError>) -> Void) where T: Codable {
        self.sessionManager.request(router).validate(statusCode: 200..<300).responseJSON { (data) in
            print(router)
            print(data)
            switch data.result {
            case .success(_):
                self.parseAPIResponse(data: data) { (result: Result<T, APIError>) in
                    switch result{
                    case .success(let data):
                        self.resetNumberOfRetries()
                        handler(.success(data))
                    case .failure(let error):
                        handler(.failure(error))
                    }
                }
            case .failure(_):
                self.parseAPIError(data: data) { (result: Result<APIError, APIError>) in
                    switch result{
                    case .success(let data):
                        handler(.failure(data))
                    case .failure(let error):
                        handler(.failure(error))
                    }
                }
            }
        }
    }
    
    
    func refreshToken<T>(router: LoginRouter, handler: @escaping (Swift.Result<T, Error>) -> Void) where T: Codable {
        self.sessionManager.request(router).validate().responseJSON { (data) in
            switch data.result {
            case .success(_):
                do {
                    guard let jsonData = data.data else {
                        throw AlertMessage(title: "Error", body: "No data")
                    }
                    let result = try JSONDecoder().decode(T.self, from: jsonData)
                    handler(.success(result))
                    self.resetNumberOfRetries()
                } catch {
                    print(error)
                }
            case .failure(_):
                let statusCode  = data.response?.statusCode
                let err = ServiceError(code: statusCode!)
                let alert = AlertMessage(title: err.title, body: err.description)
                return handler(.failure(alert))
            }
        }
    }
    
    // MARK: - Private methods
    
    private func saveRefreshToken(_ model: LoginResponse) {
        let accessToken = model.token
        Account.sharedAccount.setAccessToken(accessToken)
    }
    
    private func resetNumberOfRetries() {
        self.retrier.numberOfRetries = 0
    }
    
    private func parseApiError(data: Data?) -> AlertMessage {
        let decoder = JSONDecoder()
        if let jsonData = data, let error = try? decoder.decode(NetworkError.self, from: jsonData) {
            return AlertMessage(title: "Constants.errorAlertTitle", body: error.key ?? error.message)
        }
        return AlertMessage(title: "Constants.errorAlertTitle", body: "Constants.genericErrorMessage")
    }
    
    init(sessionManager: Session, retrier: APIManagerRetrier) {
        self.sessionManager = sessionManager
        self.retrier = retrier
    }
}
