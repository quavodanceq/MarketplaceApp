//
//  ProductViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import SnapKit

class ProductViewController: UIViewController{
    
    
    
    private let nameLabel = UILabel()
    
    private var collectionView: UICollectionView!
    
    private let pageView = UIPageControl()
    
    private let priceLabel = UILabel()
    
    private let sizesView = SizesView()
    
    private let cartButton = UIButton()
    
    private var product: Product
    
    private var productSize: String?
    
    private let alert = UIAlertController()
    
    override func viewDidLoad() {
        
        sizesView.delegate = self
        setupNavigationBar()
        setupNameLabel()
        setupCarouselView()
        setupPageView()
        setupPriceLabel()
        setupSizesView()
        setupCartButton()
        setupAlert()
        setupConstraints()
    }
    
     init(product: Product) {
        
        
        self.product = product
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavigationBar() {
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Products"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupNameLabel() {
        
        view.addSubview(nameLabel)
        nameLabel.text = product.name
        nameLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        nameLabel.textColor = .black
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .center
        
    }
    
    private func setupPageView() {
        
        view.addSubview(pageView)
        pageView.numberOfPages = product.imagesNames.count
        pageView.currentPage = 0
        pageView.hidesForSinglePage = true
    }
    
    private func setupPriceLabel() {
        
        view.addSubview(priceLabel)
        priceLabel.text = "\(product.price)$"
        priceLabel.textColor = .white
        priceLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        priceLabel.backgroundColor = .backgroundColor
        priceLabel.textAlignment = .center
    }
    
    private func setupCarouselView() {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.reloadData()
        view.addSubview(collectionView)
    }
    
    private func setupSizesView() {
        
        view.addSubview(sizesView)
    }
    
    private func setupCartButton() {
        
        view.addSubview(cartButton)
        cartButton.backgroundColor = .backgroundColor
        cartButton.setTitle("Add to cart", for: .normal)
        cartButton.setTitleColor(.white, for: .normal)
        cartButton.addTarget(self, action: #selector(cartButtonTapped), for: .touchUpInside)
        cartButton.titleLabel?.font = UIFont(name: "Georgia-Bold", size: 17)!
    }
    
    private func setupAlert() {
        alert.title = "Choose size"
        alert.message = "It looks like you haven't choose size"
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
    }
    
    
    private func setupConstraints() {
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            
        }
        
        pageView.snp.makeConstraints { make in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-10)
            make.centerX.equalToSuperview()
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(priceLabel.snp.width).multipliedBy(0.4)
        }
        
        sizesView.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(collectionView.snp.width)
            
        }
        
        cartButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-10)
            make.centerX.equalToSuperview()
            make.width.equalTo(collectionView.snp.width).multipliedBy(0.5)
        }
        
    }
    
    @objc private func cartButtonTapped(_ sender: UIButton) {
        sender.pulsate()
        sender.flash()
        if productSize != nil {
            product.size = productSize
            CartManager.shared.addToCart(product)
        } else {
            self.present(alert, animated: true)
        }
        
    }
}

extension ProductViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return product.imagesNames.count
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CarouselCell
            cell.imageName = product.imagesNames[indexPath.row]
            cell.setup()
            return cell
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width)
        return CGSize(width: size, height: size * 1.2)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageView.currentPage = indexPath.row
    }
    
    
    
    }

extension ProductViewController: ProductSizeDelegate {
    
    func productWithSizeAdded(size: String) {
        self.productSize = size
        print(self.productSize)
    }
    
    
}
