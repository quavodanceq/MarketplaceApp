//
//  UserInfoViewController.swift
//  MarketplaceApp
//
//  Created by Куат Оралбеков on 10.09.2023.
//

import Foundation
import UIKit
import iOSDropDown
import SnapKit

class UserInfoViewController: UIViewController {
    
    private let nameLabel = UILabel()
    
    private let nameTextField = UITextField()
    
    private let phoneNumberLabel = UILabel()
    
    private let phoneNumberTextField = UITextField()
    
    private let cityLabel = UILabel()
    
    let  dropDown = DropDown()
    
    private let streetLabel = UILabel()
    
    private let streetTextField = UITextField()
    
    private let homeLabel = UILabel()
    
    private let homeNumberTextField = UITextField()
    
    private let saveButton = UIButton()
    
    override func viewDidLoad() {
        setupNavigationBar()
        setupNameLabel()
        setupNameTextField()
        setupPhoneNumberLabel()
        setupPhoneNumberTextField()
        setupCityLabel()
        setupDropDown()
        setupStreetLabel()
        setupStreetTextField()
        setupHomeLabel()
        setupHomeNumberTextField()
        setupSaveButton()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        view.backgroundColor = .white
        let backButton = UIBarButtonItem()
        backButton.title = "Profile"
        backButton.tintColor = .backgroundColor
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    private func setupSaveButton() {
        
        view.addSubview(saveButton)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .backgroundColor
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc private func save() {
        
        if nameTextField.text != "" && cityLabel.text != "" && streetTextField.text != "" && homeNumberTextField.text != "" && phoneNumberTextField.text != "" {
            let userDefaults = UserDefaults.standard
            userDefaults.set(nameTextField.text, forKey: "name")
            userDefaults.set(cityLabel.text, forKey: "city")
            userDefaults.set(streetTextField.text, forKey: "street")
            userDefaults.set(homeNumberTextField.text, forKey: "homeNumber")
            userDefaults.set(phoneNumberTextField.text, forKey: "phone")
            self.navigationController?.popViewController(animated: true)
        } else {
            
            let alertController = UIAlertController(title: "Ooops!", message: "Fill al fields", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .default)
            alertController.addAction(action)
            self.present(alertController, animated: true)
            
        }
            
        
        
    }
    
    private func setupNameLabel() {
        
        view.addSubview(nameLabel)
        nameLabel.text = "Enter full name"
        nameLabel.font = UIFont(name: "Georgia-Bold", size: 22)
    }
    
    private func setupPhoneNumberLabel() {
        
        view.addSubview(phoneNumberLabel)
        phoneNumberLabel.text = "Enter your number"
        phoneNumberLabel.font = UIFont(name: "Georgia-Bold", size: 22)
    }
    
    private func setupPhoneNumberTextField() {
        
        view.addSubview(phoneNumberTextField)
        phoneNumberTextField.keyboardType = .numberPad
        let userDefaults = UserDefaults.standard
        if let number = userDefaults.object(forKey: "phone") {
            phoneNumberTextField.text = number as! String
        }
        phoneNumberTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupNameTextField() {
        
        let userDefaults = UserDefaults.standard
        if let name = userDefaults.object(forKey: "name") {
            nameTextField.text = name as! String
        }
        nameTextField.font = UIFont(name: "Georgia-Bold", size: 20)
        view.addSubview(nameTextField)
    }
    
    private func setupCityLabel() {
        
        view.addSubview(cityLabel)
        let userDefaults = UserDefaults.standard
        if let city = userDefaults.object(forKey: "city") {
            cityLabel.text = city as! String
        } else {
            cityLabel.text = "Choose your city"
        }
        cityLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        cityLabel.textColor = .black
    }
    
    private func setupDropDown() {
        
        view.addSubview(dropDown)
        dropDown.placeholder = "Choose your city"
        dropDown.optionArray = ["Aktau", "Aktobe", "Almaty", "Arkalyk", "Astana", "Atyrau", "Baikonur", "Balqash", "Jezkazgan", "Karaganda", "Kentau", "Kyzylorda", "Kokshetau", "Kostanay", "Janaozen", "Pavlodar", "Petropavl", "Ridder", "Saran", "Satpayev", "Semey", "Stepnogorsk", "Taldykorgan", "Taraz", "Temirtau", "Turkistan", "Oral", "Oskemen", "Shymkent", "Shakhtinsk", "Schuchinsk", "Ekibastuz"]
        dropDown.selectedRowColor = .backgroundColor
        dropDown.didSelect{(selectedText , index ,id) in
        self.cityLabel.text = selectedText
            }
        
    }
    
    private func setupStreetLabel() {
        
        view.addSubview(streetLabel)
        streetLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        streetLabel.textColor = .black
        streetLabel.text = "Choose your street"
    }
    
    private func setupStreetTextField() {
        
        view.addSubview(streetTextField)
        let userDefaults = UserDefaults.standard
        if let street = userDefaults.object(forKey: "street") {
            streetTextField.text = street as! String
        } else {
            streetTextField.text = "Choose your city"
        }
        streetTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupHomeLabel() {
        
        view.addSubview(homeLabel)
        homeLabel.font = UIFont(name: "Georgia-Bold", size: 22)
        homeLabel.textColor = .black
        homeLabel.text = "Choose home number"
    }
    
    private func setupHomeNumberTextField() {
        
        view.addSubview(homeNumberTextField)
        let userDefaults = UserDefaults.standard
        if let street = userDefaults.object(forKey: "homeNumber") {
            homeNumberTextField.text = street as! String
        }

        homeNumberTextField.font = UIFont(name: "Georgia-Bold", size: 20)
    }
    
    private func setupConstraints() {
        
        
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(10)
        }

        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        phoneNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        phoneNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTextField.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
        }
        
        dropDown.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview().multipliedBy(0.5)
            
        }
        
        streetLabel.snp.makeConstraints { make in
            make.top.equalTo(dropDown.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        streetTextField.snp.makeConstraints { make in
            make.top.equalTo(streetLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        homeLabel.snp.makeConstraints { make in
            make.top.equalTo(streetTextField.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
        }
        
        homeNumberTextField.snp.makeConstraints { make in
            make.top.equalTo(homeLabel.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.equalToSuperview()
        }
        
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(homeNumberTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.5)
        }

    }
    
    
}
