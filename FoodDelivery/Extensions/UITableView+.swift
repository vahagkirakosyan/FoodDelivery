//
//  UITableView+.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit

extension UITableView {
    func layoutTableHeaderView() {

        guard let headerView = self.tableHeaderView else { return }
        headerView.translatesAutoresizingMaskIntoConstraints = false

        let headerWidth = headerView.bounds.size.width
        let temporaryWidthConstraint = headerView.widthAnchor.constraint(equalToConstant: headerWidth)

        headerView.addConstraint(temporaryWidthConstraint)

        headerView.setNeedsLayout()
        headerView.layoutIfNeeded()

        let headerSize = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        let height = headerSize.height
        var frame = headerView.frame

        frame.size.height = height
        headerView.frame = frame

        self.tableHeaderView = headerView

        headerView.removeConstraint(temporaryWidthConstraint)
        headerView.translatesAutoresizingMaskIntoConstraints = true
    }
    
    func register(_ cellClass: Swift.AnyClass?) {
        
        guard let identifier = (cellClass as? NSObject.Type)?.className else {
            assertionFailure("Cannot get className from cellClass")
            return
        }
        
        register(cellClass, forCellReuseIdentifier: identifier)
    }
    
    func register(_ cellClasses: [Swift.AnyClass]) {
        cellClasses.forEach { register($0) }
    }
    
    func register(cellTypes: UITableViewCell.Type...) {
       
        cellTypes.forEach { (type) in
            let reuseIdentifier = String(describing: type)
            register(type, forCellReuseIdentifier: reuseIdentifier)
        }
        
    }
    
    func register(nibs: String...) {
        nibs.forEach { register(UINib(nibName: $0, bundle: nil), forCellReuseIdentifier: $0) }
    }
    
    func scrollToBottom(isAnimated: Bool = true){
        DispatchQueue.main.async {
            if self.numberOfRows(inSection:  self.numberOfSections-1) - 1 >= 0 {
                let indexPath = IndexPath(
                    row: self.numberOfRows(inSection:  self.numberOfSections-1) - 1,
                    section: self.numberOfSections - 1)
                if self.hasRowAtIndexPath(indexPath: indexPath) {
                    self.scrollToRow(at: indexPath, at: .bottom, animated: isAnimated)
                }
            }
        }
    }

    func scrollToTop(isAnimated: Bool = true) {
        DispatchQueue.main.async {
            let indexPath = IndexPath(row: 0, section: 0)
            if self.hasRowAtIndexPath(indexPath: indexPath) {
                self.scrollToRow(at: indexPath, at: .top, animated: isAnimated)
           }
        }
    }

    func hasRowAtIndexPath(indexPath: IndexPath) -> Bool {
        return indexPath.section < self.numberOfSections && indexPath.row < self.numberOfRows(inSection: indexPath.section)
    }
}
