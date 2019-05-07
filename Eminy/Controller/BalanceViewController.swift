//
//  BalanceViewController.swift
//  Eminy
//
//  Created by tilekbek kadyrov on 5/5/19.
//  Copyright © 2019 tilekbek kadyrov. All rights reserved.
//

import UIKit
import PhoneNumberKit
import CountryList

class BalanceViewController: UIViewController, CountryListDelegate{
    func selectedCountry(country: Country) {
        button.setTitle(country.flag, for: .normal)
        phoneNumberField.text = "+\(country.phoneExtension)"
    }
    
    
    var countryList = CountryList()
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Select Country", for: .normal)
        
        button.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()

    let phoneNumberField : LeftPaddedTextField = {
        let phone = LeftPaddedTextField()
        phone.translatesAutoresizingMaskIntoConstraints = false
        
        phone.placeholder = "Enter Phone Number"
        phone.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        
        phone.layer.borderWidth = 1
        phone.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        phone.layer.cornerRadius = 8
        phone.keyboardType = .phonePad
        
        return phone
    }()
    
    let image : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        
        image.layer.borderWidth = 1
        image.layer.borderColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        image.layer.cornerRadius = 8
        
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.title = "Reload Balance"
        
        phoneNumberField.becomeFirstResponder()
        countryList.delegate = self
        
        setupNavController()
        setupSelectButton()
        setupPhoneNumberField()
        setupImageView()
    }
    
    @objc private func handleNext() {
        
        let navController = UINavigationController(rootViewController: countryList)
        self.present(navController, animated: true, completion: nil)
        
    }
    
    private func setupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    func setupSelectButton() {
        view.addSubview(button)
        
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width/1.2).isActive = true
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height/3).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    func setupPhoneNumberField() {
        view.addSubview(phoneNumberField)
        
        phoneNumberField.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20).isActive = true
        phoneNumberField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        phoneNumberField.leadingAnchor.constraint(equalTo: button.leadingAnchor).isActive = true
        phoneNumberField.trailingAnchor.constraint(equalTo: button.trailingAnchor).isActive = true
    }
    
    func setupImageView() {
        view.addSubview(image)
        
        image.topAnchor.constraint(equalTo: phoneNumberField.bottomAnchor, constant: 20).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.widthAnchor.constraint(equalToConstant: 50).isActive = true
        image.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

}

class LeftPaddedTextField: PhoneNumberTextField {
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return  CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return  CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.width + 10, height: bounds.height)
    }
}


