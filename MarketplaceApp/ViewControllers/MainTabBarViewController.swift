//
//  MainTabBarViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit

class MainTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        setupViewControllers()
        setupAppearance()
    }
    
    private func setupViewControllers() {
        
        navigationItem.hidesBackButton = true
        let productImage = UIImage(systemName: "suitcase")
        let cartImage = UIImage(systemName: "cart")
        let productsVC = UINavigationController(rootViewController: ProductsViewController())
        let cartVC = CartViewController()
        productsVC.tabBarItem.title = "Products"
        cartVC.tabBarItem.title = "Cart"
        productsVC.tabBarItem.image = productImage
        cartVC.tabBarItem.image = cartImage
        setViewControllers([productsVC, cartVC], animated: false)
    }
    
    private func setupAppearance() {
        
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = .backgroundColor
    }
    
}
