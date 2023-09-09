//
//  CartViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import Combine
import SnapKit

class CartViewController: UIViewController {
    
    private var cart = [Product]()
    
    private let tableView = UITableView()
    
    private let emptyCartView = EmptyCartView()
    
    private let makeOrderButton = UIButton()
    
    private var cancellable = [AnyCancellable]()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupPublisher()
        setupEmptyCartView()
        setupTableView()
        setupMakeOrderButton()
        setupConstraints()
    }
    
    override func viewWillLayoutSubviews() {
        
        tableView.snp.makeConstraints { make in
            make.height.equalTo(tableView.contentSize.height)
        }
    }
    
    private func setupPublisher() {
        
        UserDefaults.standard.publisher(for: \.observableProductsData)
            .map{ data -> [Product] in
                guard let data = data else { return [] }
                return (try? JSONDecoder().decode([Product].self, from: data)) ?? []
            }.sink { products in
                
                self.cart = products
                self.tableView.reloadData()
                if self.cart.isEmpty {
                    self.tabBarItem.badgeValue = nil
                    self.emptyCartView.reveal()
                    self.emptyCartView.isHidden = false
                    self.tableView.isHidden = true
                    
                } else {
                    self.tabBarItem.badgeValue = String(self.cart.count)
                    self.emptyCartView.isHidden = true
                    self.tableView.isHidden = false
        
                    
                }
                
                print(self.cart.count)
            }.store(in: &cancellable)
        
        
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CartCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func setupEmptyCartView() {
        
        view.addSubview(emptyCartView)
    }
    
    private func setupMakeOrderButton() {
        
        view.addSubview(makeOrderButton)
        makeOrderButton.setTitle("Make order", for: .normal)
        makeOrderButton.backgroundColor = .backgroundColor
        makeOrderButton.setTitleColor(.white, for: .normal)
        makeOrderButton.addTarget(self, action: #selector(makeOrderButtonTapped), for: .touchUpInside)
    }
    
    @objc private func makeOrderButtonTapped() {
        
        FirebaseManager.shared.addOrderToFirebase(cart: cart)
    }
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview()
            make.leading.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        emptyCartView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(emptyCartView.snp.width)
        }
        
        makeOrderButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }
    }
    
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cart.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartCell
        cell.product = cart[indexPath.row]
        cell.setup()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return view.frame.height / 7
    }
        
    }
    

