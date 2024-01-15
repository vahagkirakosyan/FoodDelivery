//
//  HomeViewModel.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

struct HomeViewModel {

    var sections: [Section]
}

// MARK: - HomeViewModel + Section
extension HomeViewModel {
    
    struct Section {
             
        // MARK: - Properties
        
        let headerConfigurator: TableHeaderFooterConfiguratorProtocol?
        var rows: [Row]
        
        // MARK: - Row
        
        struct Row {
            
            // MARK: - Properties
            
            let configurator: TableCellConfiguratorProtocol
            let brandId: String
            
            var reuseId: String {
                return type(of: configurator).reuseId
            }
            
            let height: CGFloat
            var isCategory: Bool
            
            init(configurator: TableCellConfiguratorProtocol, brandId: String, height: CGFloat, isCategory: Bool = false) {
                self.configurator = configurator
                self.brandId = brandId
                self.height = height
                self.isCategory = isCategory
            }
        }
    }
}
