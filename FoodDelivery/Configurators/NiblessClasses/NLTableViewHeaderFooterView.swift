//
//  NLTableViewHeaderFooterView.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

class NLTableViewHeaderFooterView: UITableViewHeaderFooterView { // swiftlint:disable:this final_class
    
    // MARK: - UITableViewHeaderFooterView
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
}
