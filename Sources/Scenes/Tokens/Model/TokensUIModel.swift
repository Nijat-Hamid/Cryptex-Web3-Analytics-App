//
//  TokensUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation

struct TokensUIModel:Hashable,DTOConvertible {
    let id = UUID()
    let tokenName: String
    let tokenPrice, totalVolume: Double
    let tokenPriceChanges: TokenPriceChange
    let currentMCap: Double
    let chain, tokenLogo, chainLogo, overalRisk,tokenContract,protocolName: String
    
    init?(dto: SingleToken) {
        guard let tokenName = dto.tokenName,
              let tokenPrice = dto.tokenPrice,
              let totalVolume = dto.totalVolume,
              let currentMCap = dto.currentMCap,
              let chain = dto.chain,
              let tokenLogo = dto.tokenLogo,
              let chainLogo = dto.chainLogo,
              let overalRisk = dto.overalRisk,
              let tokenPriceChanges = dto.tokenPriceChanges,
              let daily = tokenPriceChanges.daily,
              let weekly = tokenPriceChanges.weekly,
              let monthly = tokenPriceChanges.monthly,
              let protocolName = dto.protocol,
              let tokenContract = dto.tokenContract
        else {return nil}
        
        self.tokenName = tokenName
        self.tokenPrice = tokenPrice
        self.totalVolume = totalVolume
        self.currentMCap = currentMCap
        self.chain = chain
        self.tokenLogo = tokenLogo
        self.chainLogo = chainLogo
        self.overalRisk = overalRisk
        self.tokenPriceChanges = TokenPriceChange(daily: daily, weekly: weekly, monthly: monthly)
        self.protocolName = protocolName
        self.tokenContract = tokenContract
    }
}

struct TokenPriceChange: Hashable {
    let daily, weekly, monthly: Double
}
