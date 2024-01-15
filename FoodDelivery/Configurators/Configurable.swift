//
//  Configurable.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

protocol Configurable {
  
    associatedtype Model
    
    func configure(with model: Model)
}
