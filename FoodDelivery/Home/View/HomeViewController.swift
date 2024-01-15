//
//  HomeViewController.swift
//  FoodDelivery
//
//  Created by Ваагн Киракосян on 12.01.2024.
//

import UIKit
import PureLayout

protocol HomeViewInput: AnyObject {
    func updateView(with viewModel: HomeViewModel)
}

protocol HomeViewOutput {
    func viewIsReady()
    func categoryChanged(name: String)
}

class HomeViewController: UIViewController {
    
    var presenter: HomeViewOutput?
    
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let cityPicker = CityPickerView()
    private let tableViewManager = HomeTableViewManager()
    private let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        drawSelf()
        presenter?.viewIsReady()
    }

    private func drawSelf() {
        view.backgroundColor = .appColor(.tableBackground)
        
        view.addSubview(cityPicker)
        cityPicker.backgroundColor = .clear
        cityPicker.configure(with: CityPickerView.Model(city: "Москва"))
        cityPicker.autoPinEdge(toSuperviewSafeArea: .top, withInset: 16)
        cityPicker.autoPinEdge(toSuperviewSafeArea: .leading, withInset: 16)
        cityPicker.autoSetDimension(.height, toSize: 20)
        
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = true
        view.addSubview(tableView)
        tableView.autoPinEdgesToSuperviewSafeArea(with: .zero, excludingEdge: .top)
        tableView.autoPinEdge(.top, to: .bottom, of: cityPicker, withOffset: 24)
        tableView.backgroundColor = .clear
        tableViewManager.setup(tableView: tableView)
        tableViewManager.delegate = self
        
        refreshControl.addTarget(self, action: #selector(refreshPage), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    @objc private func buttonAction() {
        presenter?.viewIsReady()
    }
    
    @objc private func refreshPage() {
        presenter?.viewIsReady()
    }
}

extension HomeViewController: HomeViewInput {
    func updateView(with viewModel: HomeViewModel) {
        if refreshControl.isRefreshing {
            refreshControl.endRefreshing()
        } 
        tableViewManager.update(with: viewModel)
    }
}

extension HomeViewController: HomeTableViewManagerDelegate {
    func didSelectItem(name: String, type: CategoryType) {
        presenter?.categoryChanged(name: name)
        tableViewManager.scrollTo(category: type)
    }
}

