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
        let backImage = UIImage(named: "backButton")?.resizedImage(Size: .init(width: 14, height: 14))?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: -2, right: 0))
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
