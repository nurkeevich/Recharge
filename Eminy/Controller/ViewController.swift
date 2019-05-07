//
//  ViewController.swift
//  Eminy
//
//  Created by tilekbek kadyrov on 4/30/19.
//  Copyright © 2019 tilekbek kadyrov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button : UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), for: .normal)
        
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        
        button.layer.cornerRadius = 8
        
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        setupButton()
    }
    
    @objc private func handleNext() {
        let navController = UINavigationController(rootViewController: BalanceViewController())
        self.present(navController, animated: true, completion: nil)
    }
    
    func setupButton() {
        view.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.widthAnchor.constraint(equalToConstant: view.frame.width/2).isActive = true
    }
    

}

