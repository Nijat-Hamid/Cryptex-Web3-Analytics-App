//
//  MetricsUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/18/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import DGCharts

struct MetricsCombinedModel{
    let generalData:MetricsGeneralModel
    let chartData:MetricsChartModel
    let statisticsData:MetricsStatisticsModel
}

struct MetricsChartModel:DTOConvertible{
    let historicalMcapNative, historicalMcapTvl, historicalPriceNative: [ChartDataEntry]
    
    init?(dto: MetricsDTOModel) {
        guard let historicalMcapNative = dto.historicalMcapNative,
              let historicalMcapTvl = dto.historicalMcapTvl,
              let historicalPriceNative = dto.historicalPriceNative
        else {return nil}
        
        self.historicalPriceNative = historicalPriceNative.map { ChartDataEntry(x: $0[0], y: $0[1]) }
        self.historicalMcapTvl = historicalMcapTvl.map { ChartDataEntry(x: $0[0], y: $0[1]) }
        self.historicalMcapNative = historicalMcapNative.map { ChartDataEntry(x: $0[0], y: $0[1]) }
    }
}

struct MetricsStatisticsModel:DTOConvertible{
    let psRatio: Decimal
    let pfRatio: Decimal
    let revenue: FeeRevenue
    let fee: FeeRevenue
    
    init?(dto: MetricsDTOModel) {
        guard let psRatio = dto.psRatio,
              let pfRatio = dto.pfRatio,
              let fee = dto.fee,
              let total7d = fee.total7d,
              let revenue = dto.revenue,
              let total7dRevenue = revenue.total7d
        else {return nil}
        
        self.psRatio = psRatio
        self.pfRatio = pfRatio
        self.fee = FeeRevenue(total7d: total7d)
        self.revenue = FeeRevenue(total7d: total7dRevenue)
    }

}

struct MetricsGeneralModel:DTOConvertible {
    let _id: String
    let athChange, atlChange, circulatingMarketCap, currentAth: Double
    let currentAtl: Double
    let currentMarketSupply, currentMaxSuply: Double
    let dulitedMarketCap: Double
    let marketShare: Double
    
    init?(dto: MetricsDTOModel) {
        guard let id = dto._id,
              let athChange = dto.athChange,
              let atlChange = dto.atlChange,
              let circulatingMarketCap = dto.circulatingMarketCap,
              let currentAth = dto.currentAth,
              let currentAtl = dto.currentAtl,
              let currentMaxSuply = dto.currentMaxSuply,
              let currentMarketSupply = dto.currentMarketSupply,
              let dulitedMarketCap = dto.dulitedMarketCap,
              let marketShare = dto.marketShare
              
        else {return nil}
        self._id = id
        self.athChange = athChange
        self.atlChange = atlChange
        self.circulatingMarketCap = circulatingMarketCap
        self.currentAth = currentAth
        self.currentAtl = currentAtl
        self.currentMaxSuply = currentMaxSuply
        self.currentMarketSupply = currentMarketSupply
        self.dulitedMarketCap = dulitedMarketCap
        self.marketShare = marketShare
    }
}

struct FeeRevenue {
    let total7d: Decimal
}
