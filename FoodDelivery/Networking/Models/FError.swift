//
//  FError.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Foundation

struct FErrorShort: Decodable {
    let response: FErrorResponse?
    
    struct FErrorResponse: Decodable {
        let status: Int?
        let message: String?
        let name: String?
    }
}

extension FErrorShort {
    func getErrorMessage() -> String {
        self.response?.message ?? ""
    }
}


struct FError: Decodable {
    let status: Int?
    let message: String?
    let name: String?
    
    struct FErrorResponse: Decodable {
        let statusCode: Int?
        let message: String?
        let error: String?
    }

    struct FErrorMessage: Decodable {
        let value: String?
        let property: String?
        let constraints: FErrorConstraints?
    }

    struct FErrorConstraints: Decodable {
        let Required: String?
    }
}

extension FError {
    func getErrorMessage() -> String {
        self.message ?? ""
    }
}

struct FErrorNew: Decodable {
    let message: String
    let constraint: String?
    let detail: String?
    let error: String?
    
    struct FErrorResponse: Decodable {
        let statusCode: Int?
        let message: String?
        let error: String?
    }

    struct FErrorMessage: Decodable {
        let value: String?
        let property: String?
        let constraints: FErrorConstraints?
    }

    struct FErrorConstraints: Decodable {
        let Required: String?
    }
}


extension FErrorNew {
    func getErrorMessage() -> String {
        "\(self.message)\n \(self.detail ?? "")"
    }
    func getСonstraint() -> ErrorType? {
        ErrorType(rawValue: self.constraint ?? "")
    }
}

enum ErrorType: String, Codable, CaseIterable {
    case authUserNotFount = "AUTH_USER_NOT_FOUND"
    case userDoesNotFount = "USER_DOES_NOT_EXISTS"
    case wrongAuthCode = "WRONG_AUTH_CODE"
    case userWithThisEmailAlreadyExists = "USER_WITH_THIS_EMAIL_ALREADY_EXISTS"
    case usersLoginUnique = "users_login_unique"
    case cantGetCode
    
    var errorString: String {
        switch self {
        case .authUserNotFount:
            return "Некорректный никнейм или E-mail"
        case .userDoesNotFount:
            return "Пользователя не существует"
        case .wrongAuthCode:
            return "Некорректный код*"
        case .userWithThisEmailAlreadyExists:
            return "E-mail уже используется*"
        case .usersLoginUnique:
            return "Никнейм уже используется"
        case .cantGetCode:
            return "Произошла ошибка. Повторите чуть позже"
        }
    }
}

