//
//  CartManager.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import Combine

class CartManager {
    
    private init() {}
    
    static let shared = CartManager()
    
    let userDefaults = UserDefaults.standard

    func addToCart(_ product: Product) {
        
        userDefaults.products.append(product)
    }

    func removeFromCart(_ product: Product) {
        
        let cart = userDefaults.products
        guard let index = cart.firstIndex(of: product) else {return}
        userDefaults.products.remove(at: index)
    }
    
    func removeCart() {
        
        userDefaults.products = [Product]()
    }
}
