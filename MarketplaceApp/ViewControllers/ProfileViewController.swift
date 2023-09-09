//
//  ProfileViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 10.09.2023.
//

import Foundation
import UIKit
import GoogleSignIn
import Firebase
import FirebaseAuth
import SnapKit

class ProfileViewController: UIViewController {
    
    private let nameLabel = UILabel()
    
    private let loginButton = GIDSignInButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLoginButton()
        setupConstaints()
    }
    
    private func setupNameLabel() {
        
        
    }
    
    private func setupLoginButton() {
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    private func setupConstaints() {
        
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
    }
    
    @objc private func loginButtonTapped() {
        
        AuthManager.shared.login(viewController: self) { result in
            switch result {
                
                
            case .success:
                print("success")
            case .failure:
                print("failure")
            }
        }
    }
    
}
