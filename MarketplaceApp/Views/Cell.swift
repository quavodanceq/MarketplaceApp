//
//  Cell.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 07.09.2023.
//

import UIKit
import SnapKit

class Cell: UITableViewCell {
    
    private let product: Product
    
    private let image = UIImageView()
    
    private let label = UILabel()
    
    init(product: Product) {
        self.product = product
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    private func setup() {
        setupImageView()
        setupLabel()
        setupConstraints()
    }
    
    private func setupImageView() {
        
    }
    
    private func setupLabel() {
        
    }
    
    private func setupConstraints() {
        
    }
    
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
