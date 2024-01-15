//
//  HomeRouter.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

protocol HomeRouterInput {
}

final class HomeRouter {
    
    private unowned let view: UIViewController
    
    init(view: UIViewController) {
        self.view = view
    }
}

// MARK: - HomeRouterInput
extension HomeRouter: HomeRouterInput {
    
}
