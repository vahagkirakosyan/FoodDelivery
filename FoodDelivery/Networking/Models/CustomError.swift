//
//  CustomError.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Foundation

struct CustomError: LocalizedError, Codable {
    let error: String?
    
    var localizedDescription: String {
        return error ?? ""
    }
}
