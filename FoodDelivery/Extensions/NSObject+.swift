//
//  NSObject+.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import Foundation

extension NSObject {
    
    // MARK: - Properties
    
    var className: String {
        String(describing: type(of: self))
    }
    
    class var className: String {
        String(describing: self)
    }
    
}
