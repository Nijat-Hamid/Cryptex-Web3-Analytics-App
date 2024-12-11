//
//  NavigationController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
  
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupUI(){
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground()
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.foreground,
            .font: UIFont(name: "Geist-semibold", size: 16)!
        ]
    
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().tintColor = .foreground
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().compactScrollEdgeAppearance = appearance
        }
    }
}
