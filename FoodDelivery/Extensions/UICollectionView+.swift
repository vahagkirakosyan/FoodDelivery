//
//  UICollectionView+.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

extension UICollectionView {
    
    // MARK: - Public methods
    
    convenience init(scrollDirection: UICollectionView.ScrollDirection) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = scrollDirection
        self.init(frame: .zero, collectionViewLayout: layout)
    }
    
    func reloadData(withDuration duration: TimeInterval = .zero, completion: @escaping () -> Void) {
        
        DispatchQueue.main.async { [weak self] in
            UIView.animate(withDuration: duration, animations: {
                self?.reloadData()
                
            }) { _ in
                completion()
            }
        }
    }
    
    func registerHeaders(headerTypes: UICollectionReusableView.Type...) {
        
        headerTypes.forEach {
            register(
                $0,
                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                withReuseIdentifier: $0.className
            )
        }
    }
    
    func registerCells(cellTypes: UICollectionViewCell.Type...) {
        
        cellTypes.forEach {
            register($0, forCellWithReuseIdentifier: $0.className)
        }
    }
    
    func getLastIndexPath() -> IndexPath {
        
        let lastSectionIndex = max(0, numberOfSections - 1)
        let lastRowIndex = max(0, numberOfItems(inSection: lastSectionIndex) - 1)
        
        return IndexPath(row: lastRowIndex, section: lastSectionIndex)
    }
    
}
