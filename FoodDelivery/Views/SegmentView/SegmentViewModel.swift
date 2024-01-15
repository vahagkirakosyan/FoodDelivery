//
//  SegmentViewModel.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

struct SegmentViewModel {
    
    // MARK: - Properties
    
    let rows: [Row]
    var selectedIndex: Int?
    var sectionId: String
    var needSeparator: Bool
    var inset = 0
    var isCentered: Bool
    
    
    // MARK: - Row
    
    struct Row {
        
        // MARK: - Properties
        
        let configurator: CollectionCellConfiguratorProtocol
        let identifier: String
        let brandId: String
        var isCategory: Bool
        
        // MARK: - Init
        
        init(configurator: CollectionCellConfiguratorProtocol, brandId: String, isCategory: Bool = false) {
            self.configurator = configurator
            self.identifier = type(of: configurator).reuseId
            self.brandId = brandId
            self.isCategory = isCategory
        }
    }
    
}
