//
//  CartCell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 08.09.2023.
//

import Foundation
import UIKit
import FirebaseStorage

class CartCell: UITableViewCell {
    
    var product: Product?
    
    private let image = UIImageView()
    
    private let nameLabel = UILabel()
    
    private let priceLabel = UILabel()
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    func setup() {
        backgroundColor = .red
        setupImageView()
        setupPriceLabel()
        setupPriceLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        addSubview(image)
        let imageRef = Storage.storage().reference().child(product?.imageName ?? "")
        imageRef.downloadURL { result in
            switch result {
                
            case .success(let url):
                print(url)
                self.image.sd_setImage(with: url)
            case .failure(_):
                break
            }
        }
    }
    
    private func setupNameLabel() {
        addSubview(nameLabel)
        nameLabel.text = product?.name
        priceLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        priceLabel.textColor = .black
        priceLabel.numberOfLines = 0
    }
    
    private func setupPriceLabel() {
        addSubview(priceLabel)
        let price = product?.price
        let priceString = "\(price)$"
        priceLabel.text = priceString
        priceLabel.font = UIFont(name: "Georgia-Bold", size: 17)
        priceLabel.textColor = .black
        priceLabel.numberOfLines = 0
        
    }
    
    private func setupConstraints() {
        
        image.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
            
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(image.snp.trailing).offset(10)
            
        }
        
        priceLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.leading.equalTo(image.snp.trailing).offset(10)
        }
    }
    
}
