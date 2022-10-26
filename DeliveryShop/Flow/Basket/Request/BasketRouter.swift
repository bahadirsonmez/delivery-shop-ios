//
//  EventRouter.swift
//  Walker Swift
//
//  Created by ssaylanc on 8.01.2021.
//
import Alamofire
import Foundation

enum BasketRouter: URLRequestConvertible {
    case getEventList
    case getEventDetail(id: String)
    
    static let apiURLString = "Constants.baseURL"
    
    public var path: String {
        switch self {
        case .getEventList:
            return "/api/events/?format=json"
        case .getEventDetail(let id):
            return "/api/events/\(id)/"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .getEventList, .getEventDetail:
            return .get
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try BasketRouter.apiURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        //let newURLRequest = urlRequest.description.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let newURLRequest = urlRequest.description.removingPercentEncoding
        let convertedURL = URL(string: newURLRequest!)
        urlRequest = URLRequest(url: convertedURL!)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .getEventList, .getEventDetail:
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let accessToken = Account.sharedAccount.accessToken
            urlRequest.addValue("Token " + accessToken!, forHTTPHeaderField: "Authorization")
        }
        return urlRequest
    }
}
