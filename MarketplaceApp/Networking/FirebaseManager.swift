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
                    let product = Product(imageName: document["imageName"] as! String, name: document["name"] as! String, price: document["price"] as! String, imagesNames: document["imagesNames"] as! [String], sizes: document["sizes"] as! [String], size: nil)
                    products.append(product)
                    completion(products)
                }
                
            } else {
                completion(nil)
            }

        }
    }
    
    
    func addOrderToFirebase(cart: [Product]) {
        
        var order = OrderModel(order: [OrderProduct](), address: Adress(city: "Astana", street: "Koshkarbaev", homeNumber: "40"))
        
        for product in cart {
            let orderProduct = OrderProduct(name: product.name, size: product.size ?? "XS")
            order.order.append(orderProduct)
        }
        var orderData = [String : String]()
        for i in 0..<order.order.count {
            orderData["\(i)"] = "\(order.order[i].name) \(order.order[i].size)"
        }
        orderData["city"] = order.address.city
        orderData["street"] = order.address.street
        orderData["homeNumber"] = order.address.homeNumber
        db.collection("orders").addDocument(data: orderData) { error in
            if error != nil {
                print(error?.localizedDescription)
            }
        }
        
        
        
    
        
        
    }
    
}
