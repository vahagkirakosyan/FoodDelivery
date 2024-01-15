//
//  ApiAction.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
import Alamofire

protocol APIAction: URLRequestConvertible  {
    var methods: Alamofire.HTTPMethod { get }
    var path: String { get }
    var bodyParameters: [String: Any] { get }
    var urlParameters: String { get }
    var baseURL: String { get }
    var authHeader: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}

extension APIAction {
    func asURLRequest() throws -> URLRequest {
        
        var originalRequest = try URLRequest(url: baseURL.appending(path).appending(urlParameters),
                                             method: methods,
                                             headers: authHeader)
        
        var params: [String: Any]?
        if !bodyParameters.isEmpty {
            params = nil
            do {
                let json = try JSONSerialization.data(withJSONObject: bodyParameters, options: [])
                originalRequest.httpBody = json
            } catch {
                print("Bad request")
            }
        }
        let encodedRequest = try encoding.encode(originalRequest, with: params)
        return encodedRequest
    }
}
