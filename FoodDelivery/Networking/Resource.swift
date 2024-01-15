//
//  Resource.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
import Alamofire

open class Resource<T> {
    let request: APIAction
    let multipart: ((MultipartFormData) -> Void)?
    let parse: (Any) -> Result<T>
    
    init(request: APIAction, multipart: ((MultipartFormData) -> Void)? = nil, parse: @escaping (Any) -> Result<T>) {
        self.request = request
        self.multipart = multipart
        self.parse = parse
    }
}

final class HomePizzaResource: Resource<[HomeResponse]> {
    
    init() {
        super.init(request: UserAction.home) { response -> Result<[HomeResponse]> in
            if let data = response as? Data {
                do {
                    if let str = String(data: data, encoding: .utf8)?.data(using: .utf8)?.prettyJson {
                        print(str)
                    }
                    let decodedUser = try JSONDecoder().decode([HomeResponse].self, from: data)
                    return Result.success(decodedUser)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context.debugDescription)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("\(key.stringValue) was not found, \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    do {
                        let decodedUser = try JSONDecoder().decode(CustomError.self, from: data)
                        return Result.failure(decodedUser)
                    } catch {
                        print("\(type) was expected, \(context.debugDescription)")
                    }
                } catch DecodingError.valueNotFound(let type, let context) {
                    print("no value was found for \(type), \(context.debugDescription)")
                } catch {
                    print("I know not this error")
                }
            }
            return Result.failure(CustomError(error: "Unkonwn error"))
        }
    }
}

final class HomeDessertResource: Resource<[HomeResponse]> {
    
    init() {
        super.init(request: UserAction.dessert) { response -> Result<[HomeResponse]> in
            if let data = response as? Data {
                do {
                    if let str = String(data: data, encoding: .utf8)?.data(using: .utf8)?.prettyJson {
                        print(str)
                    }
                    let decodedUser = try JSONDecoder().decode([HomeResponse].self, from: data)
                    return Result.success(decodedUser)
                } catch DecodingError.dataCorrupted(let context) {
                    print(context.debugDescription)
                } catch DecodingError.keyNotFound(let key, let context) {
                    print("\(key.stringValue) was not found, \(context.debugDescription)")
                } catch DecodingError.typeMismatch(let type, let context) {
                    do {
                        let decodedUser = try JSONDecoder().decode(CustomError.self, from: data)
                        return Result.failure(decodedUser)
                    } catch {
                        print("\(type) was expected, \(context.debugDescription)")
                    }
                } catch DecodingError.valueNotFound(let type, let context) {
                    print("no value was found for \(type), \(context.debugDescription)")
                } catch {
                    print("I know not this error")
                }
            }
            return Result.failure(CustomError(error: "Unkonwn error"))
        }
    }
}
