//
//  UserAction.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Alamofire

enum UserAction {
    // MARK: - Home
    case home
    case dessert
    
}

extension UserAction: APIAction {
    
    var methods: Alamofire.HTTPMethod {
        switch self {
        case .home, .dessert:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .home:
            return "/pizzas"
        case .dessert:
            return "/desserts"

        }
    }
    
    var bodyParameters: [String : Any] {
        switch self {
        
        default:
            return [:]
        }
    }
    
    var urlParameters: String {
        switch self {
        case .home, .dessert:
            return ""
            
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "https://pizza-and-desserts.p.rapidapi.com"
        }
    }
    
    var authHeader: HTTPHeaders? {
        let params: HTTPHeaders = [
            "X-RapidAPI-Key": "83db44e9f7mshcaa52ab98c69e4fp174d48jsn60e555964e76",
            "X-RapidAPI-Host": "pizza-and-desserts.p.rapidapi.com"
        ]
        return params
    }
    
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
}
