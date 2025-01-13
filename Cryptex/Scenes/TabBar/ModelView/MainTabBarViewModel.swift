//
//  MainTabBarViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/23/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation

class MainTabBarViewModel: NSObject {
    private let list:[MainTabBarUIModel] = [
        MainTabBarUIModel(id: 0, title: "Overview", image: "overview", viewControllerType: .overview),
        MainTabBarUIModel(id: 1, title: "Pools", image: "pool", viewControllerType: .pools),
        MainTabBarUIModel(id: 2, title: "Tokens", image: "token", viewControllerType: .tokens),
        MainTabBarUIModel(id: 3, title: "Blockchains", image: "blockchain", viewControllerType: .blockchains),
        MainTabBarUIModel(id: 4, title: "Metrics", image: "metrics", viewControllerType: .metrics),
    ]
    
    var data:[MainTabBarUIModel]{
        return list
    }
}
