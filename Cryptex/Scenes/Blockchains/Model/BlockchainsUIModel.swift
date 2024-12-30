//
//  BlockchainsUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

struct BlockchainsUIModel:Hashable,DTOConvertible{
    let _id: String
    let blockchainName: String
    let chainTvl: Double
    let marketShare: Double
    let overalRisk: String
    let tvlChange: TvlChange
    let chain:String
    let logo:String
    
    init?(dto: SingleBlockchain) {
        guard let _id = dto._id,
              let blockchainName = dto.blockchainName,
              let chainTvl = dto.chainTvl,
              let marketShare = dto.marketShare,
              let overalRisk = dto.overalRisk,
              let tvlChanges = dto.tvlChanges,
              let daily = tvlChanges.daily,
              let weekly = tvlChanges.weekly,
              let monthly = tvlChanges.monthly,
              let chain = dto.chain,
              let logo = dto.logo
        else {return nil }
        
        self._id = _id
        self.blockchainName = blockchainName
        self.chainTvl = chainTvl
        self.marketShare = marketShare
        self.overalRisk = overalRisk
        self.tvlChange = TvlChange(daily: daily, weekly: weekly, monthly: monthly)
        self.chain = chain
        self.logo = logo
    }
}
struct TvlChange: Hashable {
    let daily, weekly, monthly: Double
}
