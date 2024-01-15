//
//  HomeAssembly.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import Foundation

final class HomeAssembly: Assembly {
    
    static func assembleModule() -> Module {
        let service = ApiService()
        let dataConverter = HomeDataConverter()
        let view = HomeViewController()
        let router = HomeRouter(view: view)
        let interactor = HomeInteractor(service: service)
        let presenter = HomePresenter(dataConverter: dataConverter)
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }
}

