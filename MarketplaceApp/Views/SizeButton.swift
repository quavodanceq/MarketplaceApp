//
//  SizeButton.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 09.09.2023.
//

import Foundation
import UIKit

class SizeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    convenience init(size: String) {
        self.text = size
    }
    
    private func setup() {
        textColor = .backgroundColor
        self.backgroundColor = .white
    }
    
}
