//
//  OrdersViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 10.09.2023.
//

import Foundation
import UIKit

class OrdersViewController: UIViewController {
    
    private var orders = [FetchedOrder]()
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        
        FirebaseManager.shared.fetchOrders { orders in
            if orders != nil {
                self.orders = orders!
                self.tableView.reloadData()
            }
        }
        setupNavigation()
        setupTableView()
        setupContraints()
    }
    
    private func setupNavigation() {
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "My orders"
        let backButton = UIBarButtonItem()
        backButton.title = "Profile"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupContraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        orders.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! OrderCell
        cell.order = orders[indexPath.row]
        cell.setup()
        return cell
    }
}
