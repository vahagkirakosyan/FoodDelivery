//
//  APIClient.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Alamofire
import Foundation

protocol APIClientProtocol {
    func request<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void)
    func requestMultipart<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void)
}

struct APIClient: APIClientProtocol {
    private let retryLimit = 1
    
    func requestMultipart<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        AF
            .upload(multipartFormData: resource.multipart!, with: resource.request, interceptor: self)
            .validate()
            .responseData(emptyResponseCodes: [200, 201]) { dataResponse in
                completion(dataResponse.result.flatMap2(resource.parse))
        }
    }
    
    func request<T>(_ resource: Resource<T>, completion: @escaping (Result<T>) -> Void) {
        AF
            .request(resource.request, interceptor: self)
            .validate()
            .responseData(emptyResponseCodes: [200, 201]) { dataResponse in
                completion(dataResponse.result.flatMap2(resource.parse))
        }
    }
}

//MARK: - RequestInterceptor -

extension APIClient: RequestInterceptor {
    func retry(_ request: Alamofire.Request, for session: Alamofire.Session, dueTo error: Swift.Error, completion: @escaping (RetryResult) -> Void) {
        guard let statusCode = request.response?.statusCode else {
            completion(.doNotRetry)
            return
        }
        guard request.retryCount < retryLimit else {
            completion(.doNotRetry)
            return
        }
        switch statusCode {
        case 401:
            completion(.doNotRetry)
        default:
            completion(.doNotRetry)
        }
    }
}
