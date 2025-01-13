//
//  BlockchainsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/4/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

class AboutViewModel: NSObject {
    
    private let social:[SocialUIModel] = [
        SocialUIModel(link: "https://www.facebook.com/nicatorium/", image: "facebook"),
        SocialUIModel(link: "https://www.instagram.com/nijathamid/", image: "instagram"),
        SocialUIModel(link: "https://github.com/nijat-hamid", image: "github"),
        SocialUIModel(link: "https://www.linkedin.com/in/nijat-hamid/", image: "linkedin")
    ]
    
    
    var socialData:[SocialUIModel]{
        return social
    }
    
}
