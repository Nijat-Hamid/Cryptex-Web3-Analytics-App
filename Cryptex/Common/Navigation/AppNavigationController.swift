//
//  NavigationController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        let appearance = UINavigationBarAppearance()
        let navBar = UINavigationBar.appearance()
        let backImage = UIImage(named: "backButton")?.resizedImage(Size: .init(width: 14, height: 14))?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        
        appearance.setBackIndicatorImage(backImage, transitionMaskImage: backImage)
        appearance.configureWithTransparentBackground()
        
        appearance.backButtonAppearance.normal.titleTextAttributes = [
            .foregroundColor: UIColor.foreground,
            .font: UIFont(name: "Geist-semibold", size: 16)!
        ]
        appearance.titleTextAttributes = [
            .foregroundColor: UIColor.foreground,
            .font: UIFont(name: "Geist-semibold", size: 16)!
        ]
        
        navBar.standardAppearance = appearance
        navBar.scrollEdgeAppearance = appearance
        navBar.compactAppearance = appearance
        navBar.tintColor = .foreground
        if #available(iOS 15.0, *) {
            navBar.compactScrollEdgeAppearance = appearance
        }
    }
}
