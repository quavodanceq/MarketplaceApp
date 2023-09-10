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
        let profileImage = UIImage(systemName: "person.crop.circle")
        let productsVC = UINavigationController(rootViewController: ProductsViewController())
        let cartVC = CartViewController()
        let profileVC = UINavigationController(rootViewController: ProfileViewController())
        productsVC.tabBarItem.title = "Products"
        cartVC.tabBarItem.title = "Cart"
        profileVC.tabBarItem.title = "Profile"
        productsVC.tabBarItem.image = productImage
        cartVC.tabBarItem.image = cartImage
        profileVC.tabBarItem.image = profileImage
        setViewControllers([productsVC, cartVC, profileVC], animated: false)
    }
    
    private func setupAppearance() {
        
        UITabBar.appearance().tintColor = .white
        UITabBar.appearance().unselectedItemTintColor = .gray
        UITabBar.appearance().backgroundColor = .backgroundColor
    }
    
}
