//
//  NLCollectionViewCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

class NLCollectionViewCell: UICollectionViewCell { // swiftlint:disable:this final_class
    
    // MARK: - UICollectionViewCell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable, message: "Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this view from a nib is unsupported in favor of initializer dependency injection.")
    }
    
}