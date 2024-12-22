//
//  BlockchainsUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

struct BlockchainsUIModel:Hashable{
    let id: String
    let blockchainName: String
    let chainTvl: Double
    let marketShare: Double
    let overalRisk: String
    let tvlChanges: TvlChange
    
}
struct TvlChange: Hashable {
    let daily, weekly, monthly: Double
}
