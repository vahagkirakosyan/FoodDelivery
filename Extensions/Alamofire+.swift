//
//  Alamofire+.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

//import Alamofire
//
//extension Alamofire.AFResult {
//    public func flatMap2<T>(_ transform: (Any) throws -> Result<T>) -> Result<T> {
//        switch self {
//        case .success(let value):
//            do {
//                return try transform(value)
//            } catch {
//                return .failure(error)
//            }
//        case .failure(let error):
//            return .failure(error)
//        }
//    }
//}
