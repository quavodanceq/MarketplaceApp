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
    
    private let logOutButton = UIButton()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupLoginButton()
        setupInfoButton()
        setupOrdersButton()
        setupLogOutButton()
        setupConstaints()
        if AuthManager.shared.isUsedLoggedIn() {
            
                self.loginButton.isHidden = true
                self.infoButton.isHidden = false
                self.ordersButton.isHidden = false
                self.logOutButton.isHidden = false
            
           
        } else {
            
                self.loginButton.isHidden = false
                self.infoButton.isHidden = true
                self.ordersButton.isHidden = true
                self.logOutButton.isHidden = true
            
            
        }
        
    }
    

    
    private func setupLoginButton() {
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        view.addSubview(loginButton)
    }
    
    private func setupLogOutButton() {
        
        view.addSubview(logOutButton)
        logOutButton.setTitleColor(.white, for: .normal)
        logOutButton.addTarget(self, action: #selector(logOutButtonTapped), for: .touchUpInside)
        logOutButton.setTitle("Log out", for: .normal)
        logOutButton.backgroundColor = .backgroundColor
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
        
        logOutButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-10)
            make.width.equalToSuperview().multipliedBy(0.5)
            make.centerX.equalToSuperview()
        }
        
        
    }
    
    @objc private func loginButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        AuthManager.shared.login(viewController: self) { result in
            switch result {
            case .success:
                self.viewDidLoad()
            case .failure:
                print("failed to log in")
            }
        }
    }
    
    @objc private func ordersButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        self.navigationController?.pushViewController(OrdersViewController(), animated: true)
    }
    
    @objc private func infoButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        navigationController?.pushViewController(UserInfoViewController(), animated: true)
    }
    
    @objc private func logOutButtonTapped(_ sender: UIButton) {
        
        sender.pulsate()
        
        sender.flash()
        
        AuthManager.shared.logOut()
        viewDidLoad()
    }
    
}
