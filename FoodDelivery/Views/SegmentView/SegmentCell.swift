//
//  SegmentCell.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

protocol SegmentCellDelegate: AnyObject {
    func didSelectItem(name: String, type: CategoryType)
}

final class SegmentCell: NLTableViewCell {
    
    weak var delegate: SegmentCellDelegate?
    private let segmentView = SegmentView()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        drawSelf()
    }
    
    // MARK: - Private methods
    
    private func drawSelf() {
        contentView.layer.masksToBounds = false
        layer.masksToBounds = false
        
        segmentView.delegate = self
        contentView.addSubview(segmentView)
        segmentView.autoPinEdgesToSuperviewEdges()
    }
}

// MARK: - SegmentViewOutput
extension SegmentCell: SegmentViewOutput {
    func didSelectItem(name: String, type: CategoryType) {
        delegate?.didSelectItem(name: name, type: type)
    }
}


// MARK: - Configurable
extension SegmentCell: Configurable {
    
    struct Model {
        let viewModel: SegmentViewModel
        let isBottomLineHidden: Bool
    }
    
    func configure(with model: Model) {
        segmentView.configure(with: model.viewModel)
    }
}
