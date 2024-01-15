//
//  AssetsColors.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

enum AssetsColors {
    case background
    case red
    case whiteBackground
    case lightGray
    case textGray
    case tableBackground
}

extension UIColor {

    static func appColor(_ name: AssetsColors) -> UIColor {
        switch name {
        case .background:
            return UIColor(named: "background") ?? UIColor()
        case .red:
            return UIColor(named: "red") ?? UIColor()
        case .whiteBackground:
            return UIColor(named: "whiteBackground") ?? UIColor()
        case .lightGray:
            return UIColor(named: "lightGray") ?? UIColor()
        case .textGray:
            return UIColor(named: "textGray") ?? UIColor()
        case .tableBackground:
            return UIColor(named: "tableBackground") ?? UIColor()
        }
    }
}
