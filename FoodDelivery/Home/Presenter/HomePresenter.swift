//
//  HomePresenter.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit

final class HomePresenter {
    
    weak var view: HomeViewInput?
    var router: HomeRouterInput?
    var interactor: HomeInteractorInput?
    private let dataConverter: HomeDataConvertorInput
    private var categories: [CategoryModel] = []
    private var products: [ProductModel] = []
    private var desserts: [ProductModel] = []
    private var drinks: [ProductModel] = []
    private var promotions: [PromotionModel] = []
    private var selectedCategoryId = ""

    
    init(dataConverter: HomeDataConvertorInput) {
        self.dataConverter = dataConverter
    }
    
    private func drawCells() {
       
    }
}

// MARK: - HomeViewOutput
extension HomePresenter: HomeViewOutput {
    func categoryChanged(name: String) {
        selectedCategoryId = name

        let categoriesModels = categories.map({ CategoryModel(title: $0.title,
                                                              isSelected: selectedCategoryId == $0.title ? true : false, type: $0.type) })
        
        let viewModel = dataConverter.createViewModel(with: categoriesModels,
                                                      promotions: promotions,
                                                      products: products,
                                                      desserts: desserts,
                                                      drinkes: drinks)
        view?.updateView(with: viewModel)
    }
    
    func viewIsReady() {
//        interactor?.loadInfo()
        let categoriesArray = [CategoryModel(title: "Пицца", isSelected: true, type: .pizza),
                               CategoryModel(title: "Комбо", isSelected: false, type: .combo),
                               CategoryModel(title: "Десерты", isSelected: false, type: .dessert),
                               CategoryModel(title: "Напитки", isSelected: false, type: .drink)]
        categories = categoriesArray
        let promotionsArray = [PromotionModel(image: UIImage(named: "promotion") ?? UIImage()),
                          PromotionModel(image: UIImage(named: "promotion") ?? UIImage())]
        promotions = promotionsArray
        let productsArray = [ProductModel(icon: "pizza",
                                     name: "Ветчина и грибы",
                                     description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                     price: 345,
                                     isFirst: true),
                        ProductModel(icon: "pizza",
                                     name: "Баварские колбаски",
                                     description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                                     price: 345,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Нежный лосось",
                                     description: "Лосось, томаты черри, моцарелла, соус песто",
                                     price: 2390,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Ветчина и грибы",
                                     description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                     price: 345,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Баварские колбаски",
                                     description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                                     price: 456,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Нежный лосось",
                                     description: "Лосось, томаты черри, моцарелла, соус песто",
                                     price: 2390,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Ветчина и грибы",
                                     description: "Ветчина,шампиньоны, увеличинная порция моцареллы, томатный соус",
                                     price: 345,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Баварские колбаски",
                                     description: "Баварски колбаски,ветчина, пикантная пепперони, острая чоризо, моцарелла, томатный соус",
                                     price: 456,
                                     isFirst: false),
                        ProductModel(icon: "pizza",
                                     name: "Нежный лосось",
                                     description: "Лосось, томаты черри, моцарелла, соус песто",
                                     price: 2390,
                                     isFirst: false)]
        products = productsArray
        
        let dessertsArray = [ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 135, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 234, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 135, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 234, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 135, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 234, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 135, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 234, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 135, isFirst: false),
                             ProductModel(icon: "dessert", name: "Пицца четыре сыра", description: "Лосось, томаты черри, моцарелла, соус песто", price: 234, isFirst: false)]
        desserts = dessertsArray
        
        let drinksArray = [ProductModel(icon: "drink", name: "Спрайт", description: "Лосось, томаты черри, моцарелла, соус песто", price: 67, isFirst: false),
                           ProductModel(icon: "drink", name: "Спрайт", description: "Лосось, томаты черри, моцарелла, соус песто", price: 67, isFirst: false),
                           ProductModel(icon: "drink", name: "Спрайт", description: "Лосось, томаты черри, моцарелла, соус песто", price: 67, isFirst: false),
                           ProductModel(icon: "drink", name: "Спрайт", description: "Лосось, томаты черри, моцарелла, соус песто", price: 67, isFirst: false),
                           ProductModel(icon: "drink", name: "Спрайт", description: "Лосось, томаты черри, моцарелла, соус песто", price: 67, isFirst: false)]
        drinks = drinksArray
        let viewModel = dataConverter.createViewModel(with: categories,
                                                      promotions: promotions,
                                                      products: products,
                                                      desserts: desserts,
                                                      drinkes: drinks)
        view?.updateView(with: viewModel)
    }
}

// MARK: - HomeInteractorOutput
extension HomePresenter: HomeInteractorOutput {
    func infoLoaded(pizza: [HomeResponse], dessert: [HomeResponse]) {
        
        let categoriesArray = [CategoryModel(title: "Пицца", isSelected: true, type: .pizza),
                               CategoryModel(title: "Комбо", isSelected: false, type: .pizza),
                               CategoryModel(title: "Десерты", isSelected: false, type: .dessert),
                               CategoryModel(title: "Напитки", isSelected: false, type: .dessert)]
        categories = categoriesArray
        
        let promotions = [PromotionModel(image: UIImage(named: "promotion") ?? UIImage()),
                          PromotionModel(image: UIImage(named: "promotion") ?? UIImage()),
                          PromotionModel(image: UIImage(named: "promotion") ?? UIImage())]
        
        pizza.enumerated().forEach { index, product in
            products.append(ProductModel(icon: product.image, name: product.name, description: product.description, price: product.price, isFirst: index == 1))
        }
        
        dessert.forEach { product in
            desserts.append(ProductModel(icon: product.image, name: product.name, description: product.description, price: product.price, isFirst: false))
        }
        let viewModel = dataConverter.createViewModel(with: categories, promotions: promotions, products: products, desserts: desserts, drinkes: drinks)
        view?.updateView(with: viewModel)
        
    }
    
    func loadFailure() {
        
    }
    
 
}
