//
//  BlockchainsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MenuViewModel: NSObject {
    
    private let data:[MenuUIModel] = [
        MenuUIModel(name: "Overview", image: "overview"),
        MenuUIModel(name: "Pools", image: "pool"),
        MenuUIModel(name: "Tokens", image: "token"),
        MenuUIModel(name: "Blockchains", image: "blockchain"),
        MenuUIModel(name: "Metrics", image: "metrics")
    ]
    
    private let social:[SocialUIModel] = [
        SocialUIModel(link: "https://www.facebook.com/nicatorium/", image: "facebook"),
        SocialUIModel(link: "https://www.instagram.com/nijathamid/", image: "instagram"),
        SocialUIModel(link: "https://github.com/nijat-hamid", image: "github"),
        SocialUIModel(link: "https://www.linkedin.com/in/nijat-hamid/", image: "linkedin")
    ]
    
    var menuData:[MenuUIModel]{
        return data
    }
    
    var socialData:[SocialUIModel]{
        return social
    }
    
}
