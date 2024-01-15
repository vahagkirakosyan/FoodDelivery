//
//  HomeSpacerCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

final class SpacerCell: NLTableViewCell {

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    // MARK: - Drawing
    
    private func drawSelf() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}

// MARK: - Configurable

extension SpacerCell: Configurable {
    struct Model {
        let backgroundColor: UIColor
    }
    
    func configure(with model: Model) {
        contentView.backgroundColor = model.backgroundColor
    }
}
