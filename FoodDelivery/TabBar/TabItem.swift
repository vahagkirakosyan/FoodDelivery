//
//  TabItem.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
enum TabItem: String, CaseIterable {
    
    case home
    case contacts
    case profile
    case cart
    
    var viewController: UIViewController {
        switch self {
        case .home:
            return HomeAssembly.assembleModule()
        case .contacts:
            return UIViewController()
        case .profile:
            return UIViewController()
        case .cart:
            return UIViewController()
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Меню"
        case .contacts:
            return "Контакты"
        case .profile:
            return "Профиль"
        case .cart:
            return "Корзина"
        }
    }
    
    var icon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "homeSelectedIcon")!
        case .contacts:
            return UIImage(named: "contactsIcon")!
        case .profile:
            return UIImage(named: "profileIcon")!
        case .cart:
            return UIImage(named: "cartIcon")!
        }
    }
    
    var selectedIcon: UIImage {
        switch self {
        case .home:
            return UIImage(named: "homeSelectedIcon")!
        case .contacts:
            return UIImage(named: "contactsIcon")!
        case .profile:
            return UIImage(named: "profileIcon")!
        case .cart:
            return UIImage(named: "cartIcon")!
        }
    }
}
