//
//  HomeCategoryCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

enum CategoryType {
    case pizza
    case dessert
    case combo
    case drink
}

protocol HomeCategoryCellDelegate: AnyObject {
    func categoryTapped(name: String, type: CategoryType)
}

final class HomeCategoryCell: NLCollectionViewCell {
    
    weak var delegate: HomeCategoryCellDelegate?
    
    private let imageView = UIImageView()
    private let titleLabel = UILabel()
    private let containerView = UIView()
    private let button = UIButton()
    
    private var title = ""
    private var type: CategoryType?
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawSelf()
    }
    
    // MARK: - Drawing
    
    private func drawSelf() {
        
        contentView.backgroundColor = .appColor(.tableBackground)
        
        contentView.addSubview(containerView)
        containerView.layer.masksToBounds = true
        containerView.layer.cornerRadius = 15
        containerView.layer.cornerCurve = .continuous
        containerView.autoPinEdgesToSuperviewEdges(with: UIEdgeInsets(top: 2, left: 0, bottom: -1, right: 0), excludingEdge: .bottom)
        containerView.autoSetDimensions(to: CGSize(width: 88, height: 32))
        
        containerView.addSubview(titleLabel)
        titleLabel.font = .systemFont(ofSize: 13, weight: .semibold)
        titleLabel.textColor = .red
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.autoPinEdge(toSuperviewEdge: .trailing)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading)
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        
        containerView.addSubview(button)
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.autoPinEdgesToSuperviewEdges()
    }
    
    @objc private func buttonTapped() {
        delegate?.categoryTapped(name: title, type: type ?? .pizza)
    }
}

// MARK: - Configurable

extension HomeCategoryCell: Configurable {
    typealias Model = CategoryModel
    
    func configure(with model: Model) {
        type = model.type
        title = model.title
        titleLabel.text = title
        titleLabel.textColor = model.isSelected ? .appColor(.red) : .appColor(.red).withAlphaComponent(0.4)
        titleLabel.font = .systemFont(ofSize: 13, weight: model.isSelected ? .bold : .regular)
        containerView.layer.borderWidth = model.isSelected ? 0 : 1
        containerView.layer.borderColor = UIColor.appColor(.red).withAlphaComponent(0.4).cgColor
        containerView.backgroundColor = model.isSelected ? .appColor(.red).withAlphaComponent(0.2) :
            .appColor(.whiteBackground)
    }
}


struct CategoryModel {
    let title: String
    let isSelected: Bool
    let type: CategoryType
}
