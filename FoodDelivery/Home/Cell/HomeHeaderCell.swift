//
//  HomeHeaderCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 14.01.2024.
//

import UIKit

enum HomeHeaderType {
    case pizza
    case dessert
}

final class HomeHeaderCell: NLTableViewCell {
    
    private let titleLabel = UILabel()
    private var type: HomeHeaderType?
    private var sectionId: String?

    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    // MARK: - Drawing
    
    private func drawSelf() {
        backgroundColor = .appColor(.tableBackground)
        contentView.backgroundColor = .appColor(.tableBackground)
        selectionStyle = .none
        
        let containerView = UIView()
        addSubview(containerView)
        containerView.backgroundColor = .appColor(.tableBackground)
        containerView.autoPinEdge(toSuperviewEdge: .leading)
        containerView.autoPinEdge(toSuperviewEdge: .trailing)
        containerView.autoPinEdge(toSuperviewEdge: .top)
        containerView.autoPinEdge(toSuperviewEdge: .bottom)
        
        containerView.addSubview(titleLabel)
        titleLabel.backgroundColor = .appColor(.whiteBackground)
        titleLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        titleLabel.textColor = .appColor(.red)
        titleLabel.numberOfLines = 0
        titleLabel.autoAlignAxis(toSuperviewAxis: .horizontal)
        titleLabel.autoPinEdge(toSuperviewEdge: .leading, withInset: 24)
    }
}

// MARK: - Configurable

extension HomeHeaderCell: Configurable {
    struct Model {
        let title: String
        let type: HomeHeaderType
        let sectionId: String
    }
    
    func configure(with model: Model) {
        titleLabel.text = model.title
        type = model.type
        sectionId = model.sectionId
    }
}

