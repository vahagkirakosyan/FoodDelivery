//
//  RequestService.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Alamofire

public enum Result<Value> {
    case success(Value)
    case failure(Error)
}

protocol ApiServiceInput {
    
    func loadInfo(_ completion: @escaping (Result<[HomeResponse]>) -> Void)
    func loadDesserts(_ completion: @escaping (Result<[HomeResponse]>) -> Void)
}

struct ApiService: ApiServiceInput {
    func loadInfo(_ completion: @escaping (Result<[HomeResponse]>) -> Void) {
        api.request(HomePizzaResource(), completion: completion)
    }
    
    func loadDesserts(_ completion: @escaping (Result<[HomeResponse]>) -> Void) {
        api.request(HomeDessertResource(), completion: completion)
    }
    
    private let api: APIClientProtocol = APIClient()
}

struct Connectivity {
    static let sharedInstance = NetworkReachabilityManager()!
    static var isConnectedToInternet:Bool {
        let connected = self.sharedInstance.isReachable
        return connected
    }
}
