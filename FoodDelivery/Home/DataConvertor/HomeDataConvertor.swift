//
//  HomeDataConvertor.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

protocol HomeDataConvertorInput {
    func createViewModel(with categories: [CategoryModel], promotions: [PromotionModel], products: [ProductModel], desserts: [ProductModel], drinkes: [ProductModel]) -> HomeViewModel
}

final class HomeDataConverter {
    
    // MARK: - Typealiasis
    
    typealias SegmentCellConfigurator = TableCellConfigurator<SegmentCell, SegmentCell.Model>
    typealias SpacerCellConfigurator = TableCellConfigurator<SpacerCell, SpacerCell.Model>
    typealias ProductCellConfigurator = TableCellConfigurator<HomeProductCell, HomeProductCell.Model>
    typealias CategoryHeaderConfigurator = TableHeaderFooterConfigurator<SegmentView, SegmentView.Model>



    typealias Section = HomeViewModel.Section
    typealias Row = Section.Row
    
    // MARK: - Configurations
    
    private func createSegmentCell(model: SegmentViewModel, height: CGFloat, isBottomLineHidden: Bool = true) -> Row {
        let configurator = SegmentCellConfigurator(item: SegmentCell.Model(viewModel: model, isBottomLineHidden: isBottomLineHidden))
        return Row(configurator: configurator, brandId: "", height: height)
    }
    
    private func createSpacerCell(height: CGFloat, backgroundColor: UIColor, brendId: String) -> Row {
        let configurator = SpacerCellConfigurator(item: SpacerCell.Model(backgroundColor: backgroundColor))
        return Row(configurator: configurator, brandId: "", height: height)
    }
    
    private func createHomeCategoryHeader(categories: [CategoryModel]) -> CategoryHeaderConfigurator {
        let dataConverter = SegmentViewDataConverter(segmentItemTextColor: .appColor(.red))
        let homeCategoryHeaderModel = dataConverter.convert(categories: categories, sectionId: "")
        let homeCategoryHeaderConfigurator = CategoryHeaderConfigurator(item: homeCategoryHeaderModel, viewHeight: 32)
        return homeCategoryHeaderConfigurator
    }
    
    private func createProductCell(model: ProductModel, height: CGFloat) -> Row {
        let configurator = ProductCellConfigurator(item: ProductModel(icon: model.icon, name: model.name, description: model.description, price: model.price, isFirst: model.isFirst))
        return Row(configurator: configurator, brandId: "", height: height)
    }
}

// MARK: - HomeDataConverterInput

extension HomeDataConverter: HomeDataConvertorInput {
    func createViewModel(with categories: [CategoryModel], promotions: [PromotionModel], products: [ProductModel], desserts: [ProductModel], drinkes: [ProductModel]) -> HomeViewModel {
        
        var tableSections = [Section]()
        var rows: [Row] = []
        
        let dataConverter = SegmentViewDataConverter(segmentItemTextColor: .black)
        
        tableSections.append(Section(headerConfigurator: nil,
                                     rows: [
                                        createSegmentCell(model: dataConverter.convert(promotions: promotions,
                                                                                       sectionId: ""),
                                                          height: 112)]))
        
        products.forEach { product in
            rows.append(createProductCell(model: ProductModel(icon: product.icon,
                                                  name: product.name,
                                                  description: product.description,
                                                  price: product.price,
                                                  isFirst: product.isFirst),
                                          height: 172))
        }
        
        rows.append(createSpacerCell(height: 24, backgroundColor: .appColor(.whiteBackground), brendId: ""))
        
        tableSections.append(Section(headerConfigurator: createHomeCategoryHeader(categories: categories), rows: rows))
       
        rows = []
        
        rows.append(createSpacerCell(height: 24,
                                     backgroundColor: .appColor(.tableBackground),
                                     brendId: ""))
        desserts.forEach { dessert in
            rows.append(createProductCell(model: ProductModel(icon: dessert.icon,
                                                  name: dessert.name,
                                                  description: dessert.description,
                                                  price: dessert.price,
                                                  isFirst: dessert.isFirst),
                                          height: 172))
        }
        
        tableSections.append(Section(headerConfigurator: nil, rows: rows))
               
        rows = []
        
        rows.append(createSpacerCell(height: 24,
                                     backgroundColor: .appColor(.tableBackground),
                                     brendId: ""))
        drinkes.forEach { dessert in
            rows.append(createProductCell(model: ProductModel(icon: dessert.icon,
                                                  name: dessert.name,
                                                  description: dessert.description,
                                                  price: dessert.price,
                                                  isFirst: dessert.isFirst),
                                          height: 172))
        }
        
        tableSections.append(Section(headerConfigurator: nil, rows: rows))
        
        return HomeViewModel(sections: tableSections)
    }
    
    
}
