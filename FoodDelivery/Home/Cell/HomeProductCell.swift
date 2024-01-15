//
//  HomeProductCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
import Kingfisher

final class HomeProductCell: NLTableViewCell {
    
    private let iconView = UIImageView()
    private let nameLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    private func drawSelf() {
        contentView.backgroundColor = .appColor(.tableBackground)
        selectionStyle = .none
        
        contentView.addSubview(containerView)
        containerView.backgroundColor = .appColor(.whiteBackground)
        containerView.autoPinEdgesToSuperviewEdges()
        
        containerView.addSubview(iconView)
        iconView.autoPinEdge(toSuperviewEdge: .top, withInset: 24)
        iconView.autoPinEdge(toSuperviewEdge: .leading, withInset: 16)
        iconView.autoSetDimensions(to: CGSize(width: 132, height: 132))
        
        containerView.addSubview(nameLabel)
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.textColor = .black
        nameLabel.font = .systemFont(ofSize: 17, weight: .semibold)
        nameLabel.autoPinEdge(toSuperviewEdge: .top, withInset: 32)
        nameLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 27)
        nameLabel.autoPinEdge(.leading, to: .trailing, of: iconView, withOffset: 32)
        
        containerView.addSubview(descriptionLabel)
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .appColor(.textGray)
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.autoPinEdge(.top, to: .bottom, of: nameLabel, withOffset: 8)
        descriptionLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 27)
        descriptionLabel.autoPinEdge(.leading, to: .trailing, of: iconView, withOffset: 32)
        
        containerView.addSubview(priceLabel)
        priceLabel.textAlignment = .center
        priceLabel.textColor = .appColor(.red)
        priceLabel.layer.masksToBounds = true
        priceLabel.layer.cornerCurve = .continuous
        priceLabel.layer.cornerRadius = 6
        priceLabel.layer.borderWidth = 1
        priceLabel.layer.borderColor = UIColor.appColor(.red).cgColor
        priceLabel.autoPinEdge(toSuperviewEdge: .trailing, withInset: 24)
        priceLabel.autoPinEdge(toSuperviewEdge: .bottom, withInset: 16)
        priceLabel.autoSetDimensions(to: CGSize(width: 87, height: 32))
    }
}

// MARK: - Configurable

extension HomeProductCell: Configurable {
    typealias Model = ProductModel
    
    func configure(with model: Model) {
        containerView.clipsToBounds = true
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = model.isFirst ? 30 : 0
//        containerView.layer.cornerCurve = .continuous
        containerView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
//        if let imageURL = model.icon, let url = URL(string: imageURL) {
//            iconView.kf.setImage(with: url)
//        }
        iconView.image = UIImage(named: model.icon ?? "")
        nameLabel.text = model.name
        descriptionLabel.text = model.description
        priceLabel.text = "от \(model.price) р"
    }
}

struct ProductModel {
    let icon: String?
    let name: String
    let description: String
    let price: Int
    let isFirst: Bool
    
}
