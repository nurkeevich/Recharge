//
//  OperatorController.swift
//  Eminy
//
//  Created by tilekbek kadyrov on 5/9/19.
//  Copyright © 2019 tilekbek kadyrov. All rights reserved.
//

import UIKit

class OperatorController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.title = "Select Operator"
        setupNavController()
    }
    
    func setupNavController() {
//        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
    }

}

