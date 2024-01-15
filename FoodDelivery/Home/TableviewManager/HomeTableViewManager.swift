//
//  HomeTableViewManager.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

protocol HomeTableViewManagerInput {
//    func setup(tableView: UITableView)
    func update(with viewModel: HomeViewModel)
    func scrollTo(category: CategoryType)
}

protocol HomeTableViewManagerDelegate: AnyObject {
    func didSelectItem(name: String, type: CategoryType)

}

final class HomeTableViewManager: NSObject {
    
    private weak var tableView: UITableView?
    
    private var viewModel: HomeViewModel?
    
    weak var delegate: HomeTableViewManagerDelegate?
}


// MARK: - EditProfileTableViewManagerInput
extension HomeTableViewManager: HomeTableViewManagerInput {

    func scrollTo(category: CategoryType) {
        switch category {
        case .pizza:
            tableView?.scrollToTop(isAnimated: true)
        case .dessert:
            let indexPath = IndexPath(item: 0, section: 2)
            tableView?.scrollToRow(at: indexPath, at: .top, animated: true)
        case .combo:
            return
        case .drink:
            let indexPath = IndexPath(item: 0, section: 3)
            tableView?.scrollToRow(at: indexPath, at: .top, animated: true)
        }
    }
    
    func setup(tableView: UITableView) {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(cellTypes: SegmentCell.self)
        tableView.register(cellTypes: SpacerCell.self)
        tableView.register(cellTypes: HomeProductCell.self)
        tableView.register(SegmentView.self, forHeaderFooterViewReuseIdentifier: "\(SegmentView.self)")

        tableView.sectionHeaderHeight = 0
        self.tableView = tableView
    }
    
    func update(with viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.tableView?.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension HomeTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let section = viewModel?.sections[section],
            let configurator = section.headerConfigurator,
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: type(of: configurator).reuseId) as? SegmentView else {
            return nil
        }
        
        view.delegate = self
        configurator.configure(cell: view)
//        view.applyCircleShadow()
//        view.layer.shadowOpacity = 0.1
////        view.layer.shadowPath =
//        view.layer.shadowColor = UIColor.appColor(.lightGray).cgColor
//        view.layer.shadowOffset = CGSize(width: 0, height: 10)
//        view.layer.shadowRadius = 0.5
//        view.layer.shadowPath = UIBezierPath(rect: view.bounds).cgPath

        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == .zero {
            return .zero
        }
//        if section == 2 {
//            return .zero
//        }
        return 56
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.sections[section].rows.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let row = viewModel?.sections[indexPath.section].rows[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: row.reuseId, for: indexPath)
        
        row.configurator.configure(cell: cell)
        
        if let segmentCell = cell as? SegmentCell {
            segmentCell.delegate = self
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let row = viewModel?.sections[indexPath.section].rows[indexPath.row] else {
            return UITableView.automaticDimension
        }
        
        return row.height
    }
}

// MARK: - UITableViewDelegate

extension HomeTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let row = viewModel?.sections[indexPath.section].rows[indexPath.row] else {
            return
        }
    }
}

// MARK: - SegmentCellDelegate
extension HomeTableViewManager: SegmentCellDelegate, SegmentViewOutput {
    func didSelectItem(name: String, type: CategoryType) {
        delegate?.didSelectItem(name: name, type: type)
    }
}

//// MARK: - HomeHeaderCellDelegate
//extension HomeTableViewManager: HomeHeaderCellDelegate {
//}

// MARK: - UIScrollViewDelegate
extension HomeTableViewManager: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let totalScroll = scrollView.contentSize.height - (-scrollView.bounds.size.height )
//        
//        /* This is the percentage of the current offset / bottom offset. */
//        let percentage = scrollView.contentOffset.y / totalScroll
        tableView?.headerView(forSection: 1)?.applyCircleShadow(shadowOffset: CGSize(width: 0, height: scrollView.contentOffset.y > 150 ? 10 : 0))
        
    }
}

extension UIView {
    func applyCircleShadow(shadowRadius: CGFloat = 2,
                            shadowOpacity: Float = 0.2,
                           shadowColor: CGColor = UIColor.appColor(.lightGray).cgColor,
                            shadowOffset: CGSize = CGSize(width: 0, height: 8)) {
         layer.cornerRadius = frame.size.height / 2
         layer.masksToBounds = false
         layer.shadowColor = shadowColor
         layer.shadowOffset = shadowOffset
         layer.shadowRadius = shadowRadius
         layer.shadowOpacity = shadowOpacity
     }
    
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        layer.cornerRadius = layer.cornerRadius
    }
}
