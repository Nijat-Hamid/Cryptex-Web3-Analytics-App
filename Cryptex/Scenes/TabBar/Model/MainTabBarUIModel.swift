//
//  TabBarUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/23/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

enum TabbarControllerType{
    case overview
    case pools
    case tokens
    case blockchains
    case metrics
}

struct MainTabBarUIModel {
    let id:Int
    let title:String
    let image:String
    let viewControllerType:TabbarControllerType
}
