//
//  CellConfigurator.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

protocol ViewConfigurator {
    
    static var reuseId: String { get }
    
    func configure(cell: UIView)
    func associatedValue<T>() -> T?
}


// MARK: - Table

protocol TableHeaderFooterConfiguratorProtocol: ViewConfigurator {
    var viewHeight: CGFloat { get }
}

protocol CollectionReusableViewConfiguratorProtocol: ViewConfigurator {
    var size: CGSize { get }
}


protocol TableCellConfiguratorProtocol: ViewConfigurator {
    var cellHeight: CGFloat { get }
    var headerHeight: CGFloat { get }
}


// MARK: - Collection

protocol CollectionCellConfiguratorProtocol: ViewConfigurator {
    var size: CGSize { get }
}
