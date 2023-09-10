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
    
    private let infoButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLoginButton()
        setupInfoButton()
        setupConstaints()
    }
    
    private func setupNameLabel() {
        
        
    }
    
    private func setupLoginButton() {
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    private func setupInfoButton() {
        
        view.addSubview(infoButton)
        infoButton.setTitle("Private information", for: .normal)
        infoButton.backgroundColor = .white
        infoButton.setTitleColor(.backgroundColor, for: .normal)
        infoButton.layer.borderColor = UIColor.backgroundColor.cgColor
        infoButton.layer.borderWidth = 2
        infoButton.layer.shadowColor = UIColor.black.cgColor
        infoButton.layer.shadowRadius = 1
        infoButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        infoButton.layer.shadowOpacity = 0.5
        infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
    }
    
    private func setupConstaints() {
        
        
        loginButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        infoButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
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
    
    @objc private func infoButtonTapped() {
        
        navigationController?.pushViewController(UserInfoViewController(), animated: true)
    }
    
}
