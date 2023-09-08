//
//  FirebaseManager.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import Foundation
import FirebaseFirestore

class FirebaseManager {
    
    private init() {}
    
    static let shared = FirebaseManager()
    
    private let db = Firestore.firestore()
    
    func fetchProducts(completion: @escaping([Product]?) -> Void) {
        var products = [Product]()
        
        db.collection("products").getDocuments { snapshot, error in
            if snapshot != nil {
                for document in snapshot!.documents {
                    let product = Product(imageName: document["imageName"] as! String, name: document["name"] as! String, price: document["price"] as! String)
                    products.append(product)
                    completion(products)
                }
                
            } else {
                completion(nil)
            }

        }
    }
}
