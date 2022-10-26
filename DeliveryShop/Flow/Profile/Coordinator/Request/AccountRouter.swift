//
//  AccountRouter.swift
//  bolomio
//
//  Created by ssaylanc on 13.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Alamofire
import Foundation

enum AccountRouter: URLRequestConvertible {
    case bulkUpload(parameters: Parameters)
    
    static let apiURLString = "Constants.baseURL"

    public var path: String {
        switch self {
        case .bulkUpload:
            return "/api/contacts/bulk"
        }
    }
    
    public var method: Alamofire.HTTPMethod {
        switch self {
        case .bulkUpload:
            return .post
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try AccountRouter.apiURLString.asURL()
        var urlRequest = URLRequest(url: (url.appendingPathComponent(path)))
        //let newURLRequest = urlRequest.description.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let newURLRequest = urlRequest.description.removingPercentEncoding
        let convertedURL = URL(string: newURLRequest!)
        urlRequest = URLRequest(url: convertedURL!)
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .bulkUpload(let parameters):
            urlRequest.httpBody = parameters.encodeForHTTPBody()
            //urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let accessToken = Account.sharedAccount.accessToken
            urlRequest.addValue("Bearer " + accessToken!, forHTTPHeaderField: "Authorization")
        }
        
        return urlRequest
    }
}
