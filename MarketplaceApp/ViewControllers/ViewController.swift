//
//  ViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let tableView = UITableView()

    override func viewDidLoad() {
        FirebaseManager.shared.fetchProducts { products in
            if products != nil {
                print(products![0].name)
            }
        }
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    
}
