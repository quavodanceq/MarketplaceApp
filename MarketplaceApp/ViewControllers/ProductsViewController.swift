//
//  ViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {
    
    private var collectionView: UICollectionView!
    
    private var products = [Product]()

    override func viewDidLoad() {
        FirebaseManager.shared.fetchProducts { products in
            if products != nil {
                self.products = products ?? []
                self.collectionView.reloadData()
            }
        }
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        setupConstraints()
    }

    private func setupNavigationBar() {
        
        let image = UIImage(systemName: "signature")?.withTintColor(.black)
        let imageView = UIImageView(image: image)
        imageView.tintColor = .black
        navigationItem.titleView = imageView
    }
    
    private func setupCollectionView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ProductCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        
        collectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate   {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCell
        cell.product = products[indexPath.row]
        cell.setup()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width / 2)
        return CGSize(width: size, height: size * 1.2 )
    }
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let productViewController = ProductViewController(product: products[indexPath.row])
        self.navigationController?.pushViewController(productViewController, animated: true)
    }
    
    
    
    
    
    
}
