//
//  HomeInteractor.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Foundation

protocol HomeInteractorInput {
    func loadInfo()
}

protocol HomeInteractorOutput: AnyObject {
    func infoLoaded(pizza: [HomeResponse], dessert: [HomeResponse])
    func loadFailure()
}

final class HomeInteractor {
    
    weak var presenter: HomeInteractorOutput?
    private let service: ApiServiceInput
    private let dispatchGroup = DispatchGroup()
    private var pizzaData: [HomeResponse] = []
    private var dessertData: [HomeResponse] = []
    
    init(service: ApiServiceInput) {
        self.service = service
    }
}

// MARK: - HomeInteractorInput
extension HomeInteractor: HomeInteractorInput {
    func loadInfo() {
        loadDesserts()
        dispatchGroup.enter()
        service.loadInfo() { [weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case let .success(data):
                self?.pizzaData = data
            case let .failure(error):
                self?.presenter?.loadFailure()
            }
        }
        dispatchGroup.notify(queue: .main) { [weak self] in
            if let pizza = self?.pizzaData, let dessert = self?.dessertData {
                self?.presenter?.infoLoaded(pizza: pizza, dessert: dessert)
            } else {
                self?.presenter?.loadFailure()
            }
        }
    }
    
    func loadDesserts() {
        dispatchGroup.enter()
        service.loadDesserts() { [weak self] result in
            self?.dispatchGroup.leave()
            switch result {
            case let .success(data):
                self?.pizzaData = data
            case let .failure(error):
                self?.presenter?.loadFailure()
            }
        }
    }
}
