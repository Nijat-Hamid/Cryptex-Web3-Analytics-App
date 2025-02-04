//
//  BaseHidesTabBarViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/24/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BaseHidesTabBarVC: BaseLoadingVC {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.setTabBar(hidden: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        tabBarController?.setTabBar(hidden: false)
    }
}
