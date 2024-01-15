//
//  CityPickerView.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

final class CityPickerView: NLView {
    
    private let title = UILabel()
    private let downArrow = UIImageView()
    private let viewButton = UIButton()
   
    // MARK: - Initialization
    
    init() {
        super.init(frame: CGRect.zero)
        drawSelf()
    }
    
    // MARK: - Private methods
    
    private func drawSelf() {
        backgroundColor = .clear
        
        addSubview(title)
        title.textAlignment = .left
        title.textColor = .black
        title.font = .systemFont(ofSize: 17, weight: .semibold)
        title.autoPinEdge(toSuperviewEdge: .top)
        title.autoPinEdge(toSuperviewEdge: .leading)
        title.autoSetDimension(.height, toSize: 20)
        
        addSubview(downArrow)
        downArrow.image = UIImage(named: "downArrow")
        downArrow.autoPinEdge(toSuperviewEdge: .trailing)
        downArrow.autoPinEdge(toSuperviewEdge: .top, withInset: 7)
        downArrow.autoPinEdge(.leading, to: .trailing, of: title, withOffset: 8)
        downArrow.autoSetDimensions(to: CGSize(width: 14, height: 8))
        
        addSubview(viewButton)
        viewButton.backgroundColor = .clear
        viewButton.autoPinEdgesToSuperviewEdges()
    }
}

extension CityPickerView: Configurable {
    typealias Model = CityPickerViewModel
    
    func configure(with model: Model) {
        title.text = model.city
    }
}

struct CityPickerViewModel {
    let city: String
}
