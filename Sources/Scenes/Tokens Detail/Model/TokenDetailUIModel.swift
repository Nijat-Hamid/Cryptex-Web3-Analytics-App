//
//  TokenDetailUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/8/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import DGCharts

struct TokenCombinedModel:Hashable {
    let uiModel:TokenDetailUIModel
    let chartData:TokenDetailChartDataModel
}

struct TokenDetailChartDataModel:Hashable,DTOConvertible{
    let historicalMCap: [ChartDataEntry]
    let historicalPrice: [ChartDataEntry]
    
    init?(dto: TokenDetailDTOModel) {
        guard let historicalPrice = dto.historicalPrice,
              let historicalMCap = dto.historicalMCap
        else {return nil}
        
        self.historicalPrice = historicalPrice.map { ChartDataEntry(x: $0[0], y: $0[1]) }
        self.historicalMCap = historicalMCap.map { ChartDataEntry(x: $0[0], y: $0[1]) }
    }
}

struct TokenDetailUIModel:Hashable,DTOConvertible {
    let tokenName, tokenContract: String
    let tokenPrice: Double
    let tokenPriceChanges: PriceChanges
    let holders, currentMCap: Double
    let currentMCapChanges: PriceChanges
    let chain, tokenLogo, chainLogo, overalRisk: String
    let date: String
    let totalTx: Double
    
    init?(dto: TokenDetailDTOModel) {
        guard let tokenName = dto.tokenName,
              let tokenContract = dto.tokenContract,
              let tokenPrice = dto.tokenPrice,
              let holders = dto.holders,
              let currentMCap = dto.currentMCap,
              let chain = dto.chain,
              let tokenLogo = dto.tokenLogo,
              let chainLogo = dto.chainLogo,
              let overalRisk = dto.overalRisk,
              let date = dto.date,
              let totalTx = dto.totalTx,
              let tokenPriceChanges = dto.tokenPriceChanges,
              let priceChangeDaily = tokenPriceChanges.daily,
              let priceChangeWeekly = tokenPriceChanges.weekly,
              let priceChangeMonthly = tokenPriceChanges.monthly,
              let mcapChanges = dto.currentMCapChanges,
              let mcapChangeDaily = mcapChanges.daily,
              let mcapChangeWeekly = mcapChanges.weekly,
              let mcapChangeMonthly = mcapChanges.monthly
        else {return nil}
              
        self.tokenName = tokenName
        self.tokenContract = tokenContract
        self.tokenPrice = tokenPrice
        self.holders = holders
        self.currentMCap = currentMCap
        self.chain = chain
        self.tokenLogo = tokenLogo
        self.chainLogo = chainLogo
        self.overalRisk = overalRisk
        self.date = date
        self.totalTx = totalTx
        self.tokenPriceChanges = PriceChanges(daily: priceChangeDaily, weekly: priceChangeWeekly, monthly: priceChangeMonthly)
        self.currentMCapChanges = PriceChanges(daily: mcapChangeDaily, weekly: mcapChangeWeekly, monthly: mcapChangeMonthly)
    }
    
}

struct PriceChanges: Hashable {
    let daily, weekly, monthly: Double
}
