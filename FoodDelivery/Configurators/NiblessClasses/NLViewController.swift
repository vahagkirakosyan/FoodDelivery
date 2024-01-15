//
//  NLViewController.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

class NLViewController: UIViewController { // swiftlint:disable:this final_class
    
    // MARK: - UIViewController
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    @available(*, unavailable, message: "Loading this controller from a nib is unsupported in favor of initializer dependency injection.")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("Loading this controller from a nib is unsupported in favor of initializer dependency injection.")
    }
    
}
