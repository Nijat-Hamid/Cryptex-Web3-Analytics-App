//
//  MainTabBarViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/23/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MainTabBarViewModel: NSObject {
    private let list:[MainTabBarUIModel] = [
        MainTabBarUIModel(id: 0, title: "Overview", image: "overview", viewController: OverviewViewController()),
        MainTabBarUIModel(id: 1, title: "Pools", image: "pool", viewController: PoolsViewController()),
        MainTabBarUIModel(id: 2, title: "Tokens", image: "token", viewController: TokensViewController()),
        MainTabBarUIModel(id: 3, title: "Blockchains", image: "blockchain", viewController: BlockchainsViewController()),
        MainTabBarUIModel(id: 4, title: "Metrics", image: "metrics", viewController: MetricsViewController()),
    ]
    
    var data:[MainTabBarUIModel]{
        return list
    }
}
