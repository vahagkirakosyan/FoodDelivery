//
//  Assembly.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

typealias Module = UIViewController

protocol TransitionModel {  }

protocol Assembly {
    static func assembleModule() -> Module
    static func assembleModule(with model: TransitionModel) -> Module
}

extension Assembly {
    
    static func assembleModule() -> Module {
        fatalError("Implement assembleModule() in ModuleAssembly")
    }
    
    static func assembleModule(with model: TransitionModel) -> Module {
        fatalError("Implement assembleModule(with model: TransitionModel) in ModuleAssembly")
    }
    
}
