//
//  UIView+.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 15.01.2024.
//

import UIKit

extension UIView {
    func applyCircleShadow(shadowRadius: CGFloat = 2,
                            shadowOpacity: Float = 0.2,
                           shadowColor: CGColor = UIColor.appColor(.lightGray).cgColor,
                            shadowOffset: CGSize = CGSize(width: 0, height: 8)) {
         layer.cornerRadius = frame.size.height / 2
         layer.masksToBounds = false
         layer.shadowColor = shadowColor
         layer.shadowOffset = shadowOffset
         layer.shadowRadius = shadowRadius
         layer.shadowOpacity = shadowOpacity
     }
}

