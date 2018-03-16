//
//  NavigationController.swift
//  Test DOT iOS Arifin Firdaus
//
//  Created by Arifin Firdaus on 3/16/18.
//  Copyright © 2018 Arifin Firdaus. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(iOS 11.0, *) {
            self.navigationBar.prefersLargeTitles = true
            self.navigationItem.largeTitleDisplayMode = .always
        }
        
    }
}
