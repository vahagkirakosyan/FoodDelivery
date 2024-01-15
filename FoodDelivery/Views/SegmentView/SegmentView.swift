//
//  SegmentView.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

protocol SegmentViewInput {
    func selectItem(with indexPath: IndexPath, sectionId: String)
}

protocol SegmentViewOutput: AnyObject {
    func didSelectItem(name: String, type: CategoryType)
}

final class SegmentView: NLTableViewHeaderFooterView {
    
    // MARK: - Locals
    
    private enum Locals {
        static let collectionLineSpacing: CGFloat = 20
    }
    
    
    // MARK: - UI
    
    private let centeredCollectionViewFlowLayout = CenteredCollectionViewFlowLayout()
    private var collectionView = UICollectionView(scrollDirection: .horizontal)
    
    // MARK: - Properties
    
    weak var delegate: SegmentViewOutput?
    
    var selectedIndex: Int {
        return viewModel?.selectedIndex ?? 0
    }
    
    private let separatorView = UIView()
    
    var sectionId: String = ""
    
    private var viewModel: SegmentViewModel? {
        didSet {
            collectionView.reloadData()
            
            if let selectedIndex = viewModel?.selectedIndex, collectionView.numberOfItems(inSection: 0) - 1 > selectedIndex {
                if selectedIndex > 3 {
                    collectionView.scrollToItem(at: IndexPath(row: selectedIndex, section: 0),
                                                at: .centeredHorizontally,
                                                animated: true)
                }
            }
        }
    }
    
    func scrollToBegin() {
        collectionView.scrollToItem(at: IndexPath(row: 0, section: 0),
                                    at: .left,
                                    animated: false)
    }
    
    // MARK: - Initialization
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .appColor(.tableBackground)
        centeredCollectionViewFlowLayout.minimumLineSpacing = Locals.collectionLineSpacing
        centeredCollectionViewFlowLayout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = centeredCollectionViewFlowLayout
        
        layer.masksToBounds = false
        
        separatorView.isHidden = true
        separatorView.backgroundColor = .black
        contentView.addSubview(separatorView)
        separatorView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .top)
        separatorView.autoSetDimension(.height, toSize: 1)

        collectionView.layer.masksToBounds = false
        collectionView.registerCells(cellTypes: HomeCategoryCell.self)
        collectionView.registerCells(cellTypes: HomePromotionCell.self)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.contentSize = .zero
        collectionView.isPagingEnabled = false
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        
        collectionView.autoPinEdgesToSuperviewEdges(with: .zero, excludingEdge: .bottom)
        collectionView.autoPinEdge(.bottom, to: .top, of: separatorView)
    }
    
}


// MARK: - UICollectionViewDelegate & UICollectionViewDataSource
extension SegmentView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if let count = viewModel?.rows.count, count > 0 {
            return count
        } else {
            return 0
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let row = viewModel?.rows[indexPath.row] else {
            return UICollectionViewCell()
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: row.identifier, for: indexPath)
        row.configurator.configure(cell: cell)

        if let cell = cell as? HomeCategoryCell {
            cell.delegate = self
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let row = viewModel?.rows[indexPath.row] else {
            return
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        
        visibleRect.origin = collectionView.contentOffset
        visibleRect.size = collectionView.bounds.size
        
        let visiblePoint = CGPoint(x: visibleRect.midX, y: visibleRect.midY)
        
        guard let indexPath = collectionView.indexPathForItem(at: visiblePoint) else { return }

        guard let row = viewModel?.rows[indexPath.row] else {
            return
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension SegmentView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        guard let row = viewModel?.rows[indexPath.row] else {
            return .zero
        }
        
        return row.configurator.size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}


// MARK: - SegmentViewInput
extension SegmentView: SegmentViewInput {
    
    func selectItem(with indexPath: IndexPath, sectionId: String) {
    }
    
}

// MARK: - Configurable
extension SegmentView: Configurable {
    
    typealias Model = SegmentViewModel
    
    func configure(with model: Model) {
        sectionId = model.sectionId
        
        centeredCollectionViewFlowLayout.collectionInset = model.inset
        centeredCollectionViewFlowLayout.isCentered = model.isCentered
        viewModel = model
        separatorView.isHidden = !model.needSeparator
    }
    
}

extension SegmentView: HomeCategoryCellDelegate {
    func categoryTapped(name: String, type: CategoryType) {
        delegate?.didSelectItem(name: name, type: type)
    }
}
