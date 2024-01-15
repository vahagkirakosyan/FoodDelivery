//
//  HomeResponse.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Foundation

struct HomeResponse: Decodable {
    let image: String
    let id: Int
    let price: Int
    let description: String
    let name: String
}
