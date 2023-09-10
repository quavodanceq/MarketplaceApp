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
    
    private let loginButton = GIDSignInButton()
    
    private let infoButton = UIButton()
    
    private let ordersButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLoginButton()
        setupInfoButton()
        setupOrdersButton()
        setupConstaints()
    }
    

    
    private func setupLoginButton() {
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    private func setupOrdersButton() {
        
        view.addSubview(ordersButton)
        ordersButton.setTitle("My orders", for: .normal)
        ordersButton.backgroundColor = .white
        ordersButton.setTitleColor(.backgroundColor, for: .normal)
        ordersButton.layer.borderColor = UIColor.backgroundColor.cgColor
        ordersButton.layer.borderWidth = 2
        ordersButton.layer.shadowColor = UIColor.black.cgColor
        ordersButton.layer.shadowRadius = 1
        ordersButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        ordersButton.layer.shadowOpacity = 0.5
        ordersButton.addTarget(self, action: #selector(ordersButtonTapped), for: .touchUpInside)
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
        
        ordersButton.snp.makeConstraints { make in
            make.top.equalTo(infoButton.snp.bottom).offset(10)
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
    
    @objc private func ordersButtonTapped() {
        
        self.navigationController?.pushViewController(OrdersViewController(), animated: true)
    }
    
    @objc private func infoButtonTapped() {
        
        navigationController?.pushViewController(UserInfoViewController(), animated: true)
    }
    
}
