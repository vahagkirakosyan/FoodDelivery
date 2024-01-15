//
//  SegmentViewDataConverter.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 13.01.2024.
//

import UIKit
import CoreLocation

protocol SegmentViewDataConverterInput {
    func convert(promotions: [PromotionModel], sectionId: String) -> SegmentViewModel
    func convert(categories: [CategoryModel], sectionId: String) -> SegmentViewModel
}

final class SegmentViewDataConverter {
    
    // MARK: - Typealiases
    
    typealias HomeCategoryCellConfig = CollectionCellConfigurator<HomeCategoryCell, HomeCategoryCell.Model>
    typealias HomePromotionCellConfig = CollectionCellConfigurator<HomePromotionCell, HomePromotionCell.Model>
    typealias Row = SegmentViewModel.Row
    
    
    // MARK: - Properties
    
    private var segmentItemTextColor: UIColor = .appColor(.whiteBackground)
    
    
    // MARK: - Init
    
    init(segmentItemTextColor: UIColor) {
        self.segmentItemTextColor = segmentItemTextColor
    }
    
    
    // MARK: - Builders
    
    private func createHomeCategoryCell(with model: CategoryModel) -> Row {
        let width: CGFloat = 88
        
        let height: CGFloat = 56
        
        let size = CGSize(width: width, height: height)
        let configurator = HomeCategoryCellConfig(item: model, size: size)
        return Row(configurator: configurator, brandId: "category", isCategory: true)
    }
    
    private func createPromotionCell(with model: PromotionModel) -> Row {
        let width: CGFloat = 308
        let height: CGFloat = 112
        
        let size = CGSize(width: width, height: height)
        let configurator = HomePromotionCellConfig(item: model, size: size)
        return Row(configurator: configurator, brandId: "promotions")
    }
}

//MARK: - SegmentViewDataConverterInput
extension SegmentViewDataConverter: SegmentViewDataConverterInput {
    func convert(promotions: [PromotionModel], sectionId: String) -> SegmentViewModel {
        let rows = promotions.map { createPromotionCell(with: $0) }
        return SegmentViewModel(rows: rows, sectionId: "", needSeparator: false, inset: 16, isCentered: false)
    }
    
    func convert(categories: [CategoryModel], sectionId: String) -> SegmentViewModel {
        let rows = categories.map { createHomeCategoryCell(with: $0) }
        let indexOfSelected = categories.firstIndex(where: { $0.isSelected == true })
        return SegmentViewModel(rows: rows, selectedIndex: indexOfSelected, sectionId: sectionId, needSeparator: false, inset: 16, isCentered: false)
    }
}
