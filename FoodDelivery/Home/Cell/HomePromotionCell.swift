//
//  HomePromotionCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

final class HomePromotionCell: NLCollectionViewCell {
    
    private let imageView = UIImageView()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        contentView.backgroundColor = .clear
        
        let containerView = UIView()
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 10
        containerView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 3, left: 0, bottom: 0, right: 8))
        
//        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .appColor(.tableBackground)
        imageView.layer.cornerRadius = 10
        imageView.layer.cornerCurve = .continuous
        imageView.layer.masksToBounds = true
        contentView.addSubview(imageView)
        imageView.autoPinEdgesToSuperviewEdges(/*with: UIEdgeInsets(top: -13, left: -15, bottom: -20, right: -15)*/)
    }
}

// MARK: - Configurable

extension HomePromotionCell: Configurable {
    typealias Model = PromotionModel
    
    func configure(with model: Model) {
        imageView.image = model.image
    }
}

struct PromotionModel {
    let image: UIImage

}
