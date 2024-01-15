//
//  NavigationMenuBaseController.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
import Foundation

final class NavigationMenuBaseController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        view.backgroundColor = .appColor(.whiteBackground)
        let label = UILabel()
        tabBar.addSubview(label)
        label.text = " "
        label.autoSetDimension(.height, toSize: 0.5)
        label.backgroundColor = .gray.withAlphaComponent(0.3)
        label.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        tabBar.tintColor = .appColor(.red)
        tabBar.unselectedItemTintColor = .appColor(.lightGray)
        
        let home = HomeAssembly.assembleModule()
        let contacts = UIViewController()
        let profile = UIViewController()
        let cart = UIViewController()
        tabBar.backgroundColor = .appColor(.whiteBackground)
        self.viewControllers = [
            home,
            contacts,
            profile,
            cart,
        ]
        if let tabBarItem = tabBar.items?[0] {
            tabBarItem.title = TabItem.home.title
            tabBarItem.image = TabItem.home.icon
            tabBarItem.selectedImage = TabItem.home.selectedIcon
        }
        
        if let tabBarItem = tabBar.items?[1] {
            tabBarItem.title = TabItem.contacts.title
            tabBarItem.image = TabItem.contacts.icon
            tabBarItem.selectedImage = TabItem.contacts.selectedIcon
        }

        if let tabBarItem = tabBar.items?[2] {
            tabBarItem.title = TabItem.profile.title
            tabBarItem.image = TabItem.profile.icon
            tabBarItem.selectedImage = TabItem.profile.selectedIcon
        }
        
        if let tabBarItem = tabBar.items?[3] {
            tabBarItem.title = TabItem.cart.title
            tabBarItem.image = TabItem.cart.icon
            tabBarItem.selectedImage = TabItem.cart.selectedIcon
        }
        
        selectedIndex = 0
    }
}

extension NavigationMenuBaseController: UITabBarControllerDelegate {
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        
    }
}
