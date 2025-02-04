//
//  BlockchainDetailUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import DGCharts

struct BlockchainCombinedModel:Hashable{
    let uiModel: BlockchainDetailUIModel
    let chartData: BlockchainDetailChartDataModel
}

struct BlockchainDetailChartDataModel:Hashable,DTOConvertible{
    let historicalTvl: [ChartDataEntry]
    let historicalMcap: [ChartDataEntry]
    let historicalMcapTvl: [ChartDataEntry]
    
    init?(dto: BlockchainDetailDTOModel) {
        guard let historicalTvl = dto.historicalTvl,
              let historicalMcap = dto.historicalMcap,
              let historicalMcapTvl = dto.historicalMcapTvl
        else {return nil}
        
        self.historicalTvl = historicalTvl.map { ChartDataEntry(x: Double($0.date), y: $0.tvl) }
        self.historicalMcap = historicalMcap.map { ChartDataEntry(x: $0[0], y: $0[1]) }
        self.historicalMcapTvl = historicalMcapTvl.map { ChartDataEntry(x: $0[0], y: $0[1]) }
    }
}

struct BlockchainDetailUIModel: Hashable,DTOConvertible {
    let _id: String
    let address, blockchainName: String
    let chainTvl: Double
    let creationDate: String?
    let currentMcap, currentMcapTvl: Double
    let logo: String
    let marketShare: Double
    let overalRisk: String
    let tvlChanges: Changes
    
    init?(dto: BlockchainDetailDTOModel) {
        guard let _id = dto._id,
              let address = dto.address,
              let chainTvl = dto.chainTvl,
              let creationDate = dto.creationDate,
              let currentMcap = dto.currentMcap,
              let currentMcapTvl = dto.currentMcapTvl,
              let logo = dto.logo,
              let marketShare = dto.marketShare,
              let overalRisk = dto.overalRisk,
              let tvlChanges = dto.tvlChanges,
              let daily = tvlChanges.daily,
              let weekly = tvlChanges.weekly,
              let monthly = tvlChanges.monthly,
              let blockchainName = dto.blockchainName
        else {return nil}
        
        self._id = _id
        self.blockchainName = blockchainName
        self.address = address
        self.chainTvl = chainTvl
        self.creationDate = creationDate
        self.currentMcap = currentMcap
        self.currentMcapTvl = currentMcapTvl
        self.logo = logo
        self.marketShare = marketShare
        self.overalRisk = overalRisk
        self.tvlChanges = Changes(daily: daily, weekly: weekly, monthly: monthly)
    }
}

struct HistoricalTvls: Hashable {
    let date: Int
    let tvl: Double
}

struct Changes: Hashable {
    let daily, weekly, monthly: Double
}
