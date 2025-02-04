//
//  PoolDetailUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/15/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import DGCharts

enum PoolsDetailCombinedUIModel {
    case detailLendingModel(DetailLendingCombinedModel)
    case detailDexModel(DetailDexCombinedModel)
}

enum DetailCombinedUIData {
    case lending(DetailLendingUIModel)
    case dex(DetailDexUIModel)
}

struct DetailChartModel:DTOConvertible{
    let historicalTvl: [ChartDataEntry]
    let historicalApy: [ChartDataEntry]
    
    init?(dto: PoolsDetailCombinedDTOModel) {
        switch dto {
        case .detailLendingModel(let data):
            guard let historicalApyTvl = data.historicalApyTvl else {return nil}
            
            self.historicalApy = historicalApyTvl.map { ChartDataEntry(x: $0.timestamp, y: $0.apy) }
            self.historicalTvl = historicalApyTvl.map { ChartDataEntry(x: $0.timestamp, y: $0.tvlUsd) }
            
        case .detailDexModel(let data):
            guard let historicalApyTvl = data.historicalApyTvl else {return nil}
            
            self.historicalApy = historicalApyTvl.map { ChartDataEntry(x: $0.timestamp, y: $0.apy) }
            self.historicalTvl = historicalApyTvl.map { ChartDataEntry(x: $0.timestamp, y: $0.tvlUsd) }
        }
    }
}


struct DetailLendingCombinedModel{
    let uiData:DetailLendingUIModel
    let chartData:DetailChartModel
}

struct DetailDexCombinedModel{
    let uiData:DetailDexUIModel
    let chartData:DetailChartModel
}

struct DetailLendingUIModel:DTOConvertible {
    let _id, symbol: String
    let apy: Double
    let historicalTvlChanges: HistoricalTvlChangesUI
    let overalRisk, poolContract: String
    let poolDepositors: Double
    let poolLogo: [String]
    let poolPrice: Double
    let protocolChainLogo: String
    let tvlUSD: Double
    let date: String
    let totalTx: Double
    let protocolFullName:String
    let protocolLogo:String
    let chain:String
    
    init?(dto: DetailLendingDTOModel) {
        guard let _id = dto._id,
              let symbol = dto.symbol,
              let apy = dto.apy,
              let overalRisk = dto.overalRisk,
              let poolContract = dto.poolContract,
              let poolDepositors = dto.poolDepositors,
              let poolLogo = dto.poolLogo,
              let poolPrice = dto.poolPrice,
              let protocolChainLogo = dto.protocolChainLogo,
              let tvlUSD = dto.tvlUSD,
              let date = dto.date,
              let totalTx = dto.totalTx,
              let historicalTvlChanges = dto.historicalTvlChanges,
              let daily = historicalTvlChanges.daily,
              let weekly = historicalTvlChanges.weekly,
              let monthly = historicalTvlChanges.monthly,
              let chain = dto.chain,
              let protocolLogo = dto.protocolLogo,
              let protocolFullName = dto.protocolFullName
        else {return nil}
        
        self._id = _id
        self.symbol = symbol
        self.apy = apy
        self.overalRisk = overalRisk
        self.poolContract = poolContract
        self.poolDepositors = poolDepositors
        self.poolLogo = poolLogo
        self.poolPrice = poolPrice
        self.protocolChainLogo = protocolChainLogo
        self.tvlUSD = tvlUSD
        self.date = date
        self.totalTx = totalTx
        self.historicalTvlChanges = HistoricalTvlChangesUI(daily: daily, weekly: weekly, monthly: monthly)
        self.chain = chain
        self.protocolLogo = protocolLogo
        self.protocolFullName = protocolFullName
    }
    
}

struct DetailDexUIModel:DTOConvertible {
    let _id, symbol: String
    let apy: Double
    let historicalTvlChanges: HistoricalTvlChangesUI
    let overalRisk, poolContract: String
    let poolDepositors: Double
    let poolLogo: [String]
    let poolName, protocolChainLogo: String
    let tradingFee, tvlUSD: Double
    let date: String
    let totalTx: Double
    let protocolFullName:String
    let protocolLogo:String
    let chain:String
    
    init?(dto: DetailDexDTOModel) {
        guard let _id = dto._id,
              let symbol = dto.symbol,
              let apy = dto.apy,
              let overalRisk = dto.overalRisk,
              let poolContract = dto.poolContract,
              let poolDepositors = dto.poolDepositors,
              let poolLogo = dto.poolLogo,
              let protocolChainLogo = dto.protocolChainLogo,
              let tvlUSD = dto.tvlUSD,
              let date = dto.date,
              let totalTx = dto.totalTx,
              let poolName = dto.poolName,
              let tradingFee = dto.tradingFee,
              let historicalTvlChanges = dto.historicalTvlChanges,
              let daily = historicalTvlChanges.daily,
              let weekly = historicalTvlChanges.weekly,
              let monthly = historicalTvlChanges.monthly,
              let chain = dto.chain,
              let protocolLogo = dto.protocolLogo,
              let protocolFullName = dto.protocolFullName
        else {return nil}
        
        self._id = _id
        self.symbol = symbol
        self.apy = apy
        self.overalRisk = overalRisk
        self.poolContract = poolContract
        self.poolDepositors = poolDepositors
        self.poolLogo = poolLogo
        self.protocolChainLogo = protocolChainLogo
        self.tvlUSD = tvlUSD
        self.date = date
        self.totalTx = totalTx
        self.poolName = poolName
        self.tradingFee = tradingFee
        self.historicalTvlChanges = HistoricalTvlChangesUI(daily: daily, weekly: weekly, monthly: monthly)
        self.chain = chain
        self.protocolLogo = protocolLogo
        self.protocolFullName = protocolFullName
    }
}


struct HistoricalApyTvlUI{
    let timestamp: Double
    let tvlUsd: Double
    let apy: Double
}

struct HistoricalTvlChangesUI{
    let daily, weekly, monthly: Double
}
