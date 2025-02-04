//
//  OverviewUIMOdel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/27/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import DGCharts

enum OverviewUIModel{
    case lendingUIModel(OverviewLendingUIModel)
    case dexUIModel(OverviewDexUIModel)
}

struct OverviewDexUIModel{
    let statistics:DexProtocolStatisticsModel
    let detailData:DexProtocolDetailModel
    let charData:DexProtocolChartModel
}

struct OverviewLendingUIModel{
    let statistics:LendingProtocolStatisticsModel
    let detailData:LendingProtocolDetailModel
    let charData:LendingProtocolChartModel
}


// MARK: Statistics Component Model
enum OverviewStatisticsModel{
    case lendingModel(LendingProtocolStatisticsModel)
    case dexModel(DexProtocolStatisticsModel)
}

struct LendingProtocolStatisticsModel{
    let _id: String
    let averageApy: [String: Decimal]
    let contract, creationDate: [String: String]
    let currentChainTvls: [String: Decimal]
    let logo: String
    let overalRisk: [String: String]
    let parentProtocol: String
    let poolsNumber: [String: Decimal]
    let selectChains, selectProtocols: [Select]
    let type: String
    let chainTvlChanges:[String:ValueChange]
    let timeRisk:String
    
    init?(dto: LendingProtocolModel) {
        guard let _id = dto._id,
              let averageApy = dto.averageApy,
              let contract = dto.contract,
              let creationDate = dto.creationDate,
              let currentChainTvls = dto.currentChainTvls,
              let logo = dto.logo,
              let overalRisk = dto.overalRisk,
              let parentProtocol = dto.parentProtocol,
              let poolsNumber = dto.poolsNumber,
              let selectChains = dto.selectChains,
              let selectProtocols = dto.selectProtocols,
              let type = dto.type,
              let chainTvlChanges = dto.chainTvlChanges,
              let timeRisk = dto.timeRisk
        else {return nil}
        
        self._id = _id
        self.averageApy = averageApy
        self.contract = contract
        self.creationDate = creationDate
        self.currentChainTvls = currentChainTvls
        self.logo = logo
        self.overalRisk = overalRisk
        self.parentProtocol = parentProtocol
        self.poolsNumber = poolsNumber
        self.selectChains = selectChains
        self.selectProtocols = selectProtocols
        self.type = type
        self.chainTvlChanges = chainTvlChanges.mapValues {chain in
            ValueChange(daily: chain.daily , weekly: chain.weekly, monthly: chain.monthly)
        }
        self.timeRisk = timeRisk
    }
}

struct DexProtocolStatisticsModel:DTOConvertible{
    let _id: String
    let averageApy: [String: Decimal]
    let contract, creationDate: [String: String]
    let currentChainTvls: [String: Decimal]
    let logo: String
    let overalRisk: [String: String]
    let parentProtocol: String
    let poolsNumber: [String: Decimal]
    let selectChains, selectProtocols: [Select]
    let type: String
    let chainTvlChanges:[String:ValueChange]
    let timeRisk:String
    
    init?(dto: DexProtocolModel) {
        guard let _id = dto._id,
              let averageApy = dto.averageApy,
              let contract = dto.contract,
              let creationDate = dto.creationDate,
              let currentChainTvls = dto.currentChainTvls,
              let logo = dto.logo,
              let overalRisk = dto.overalRisk,
              let parentProtocol = dto.parentProtocol,
              let poolsNumber = dto.poolsNumber,
              let selectChains = dto.selectChains,
              let selectProtocols = dto.selectProtocols,
              let type = dto.type,
              let chainTvlChanges = dto.chainTvlChanges,
              let timeRisk = dto.timeRisk
        else {return nil}
        
        self._id = _id
        self.averageApy = averageApy
        self.contract = contract
        self.creationDate = creationDate
        self.currentChainTvls = currentChainTvls
        self.logo = logo
        self.overalRisk = overalRisk
        self.parentProtocol = parentProtocol
        self.poolsNumber = poolsNumber
        self.selectChains = selectChains
        self.selectProtocols = selectProtocols
        self.type = type
        self.chainTvlChanges = chainTvlChanges.mapValues {chain in
            ValueChange(daily: chain.daily , weekly: chain.weekly, monthly: chain.monthly)
        }
        self.timeRisk = timeRisk
    }
}

// MARK: Detail Component Model
enum OverviewDetailModel{
    case lendingModel(LendingProtocolDetailModel)
    case dexModel(DexProtocolDetailModel)
}

struct LendingProtocolDetailModel:DTOConvertible{
    let tvl:Decimal
    let totalDepositedAmountAll:Decimal
    let currentTotalBorrowed:Decimal
    let historicalTotalBorrowedChanges:ValueChange
    let historicalDepositAmountChanges:ValueChange
    let historicalTvlChanges:ValueChange
    
    init?(dto: LendingProtocolModel) {
        guard let tvl = dto.tvl,
              let totalDepositedAmountAll = dto.totalDepositedAmountAll,
              let currentTotalBorrowed = dto.currentTotalBorrowed,
              let historicalTotalBorrowedChanges = dto.historicalTotalBorrowedChanges,
              let historicalDepositAmountChanges = dto.historicalDepositAmountChanges,
              let historicalTvlChanges = dto.historicalTvlChanges
        else {return nil}
        
        self.tvl = tvl
        self.totalDepositedAmountAll = totalDepositedAmountAll
        self.currentTotalBorrowed = currentTotalBorrowed
        self.historicalTotalBorrowedChanges = ValueChange(daily: historicalTotalBorrowedChanges.daily, weekly: historicalTotalBorrowedChanges.weekly, monthly: historicalTotalBorrowedChanges.monthly)
        self.historicalDepositAmountChanges = ValueChange(daily: historicalDepositAmountChanges.daily, weekly: historicalDepositAmountChanges.weekly, monthly: historicalDepositAmountChanges.monthly)
        self.historicalTvlChanges = ValueChange(daily: historicalTvlChanges.daily, weekly: historicalTvlChanges.weekly, monthly: historicalTvlChanges.monthly)
    }
}

struct DexProtocolDetailModel{
    let tvl:Decimal
    let fee:Decimal
    let volumeTotal24h:Decimal
    let feeChanges:ValueChange
    let historicalVolumeChanges:ValueChange
    let historicalTvlChanges:ValueChange
    
    init?(dto: DexProtocolModel) {
        guard let tvl = dto.tvl,
              let fee = dto.fee,
              let volumeTotal24h = dto.volumeTotal24h,
              let feeChanges = dto.feeChanges,
              let historicalVolumeChanges = dto.historicalVolumeChanges,
              let historicalTvlChanges = dto.historicalTvlChanges
        else {return nil}
        
        self.tvl = tvl
        self.fee = fee.total24h
        self.volumeTotal24h = volumeTotal24h
        self.feeChanges = ValueChange(daily: feeChanges.daily, weekly: feeChanges.weekly, monthly: feeChanges.monthly)
        self.historicalVolumeChanges = ValueChange(daily: historicalVolumeChanges.daily, weekly: historicalVolumeChanges.weekly, monthly: historicalVolumeChanges.monthly)
        self.historicalTvlChanges = ValueChange(daily: historicalTvlChanges.daily, weekly: historicalTvlChanges.weekly, monthly: historicalTvlChanges.monthly)
    }
}

// MARK: Chart Model
enum OverviewChartModel {
    case lendingModel(LendingProtocolChartModel)
    case dexModel(DexProtocolChartModel)
}

struct LendingProtocolChartModel:DTOConvertible{
    let historicalDepositedAmountChain: [String: [ChartDataEntry]]
    let historicalTotalBorrowedChains: [String: [ChartDataEntry]]
    let historicalchainTvls: [String: [ChartDataEntry]]
    
    init?(dto: LendingProtocolModel) {
        guard let historicalDepositedAmountChain = dto.historicalDepositedAmountChain,
              let historicalTotalBorrowedChains = dto.historicalTotalBorrowedChains,
              let historicalchainTvls = dto.historicalchainTvls
        else {return nil}
        
        self.historicalDepositedAmountChain = historicalDepositedAmountChain.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.totalLiquidityUSD)}
        }
        
        self.historicalTotalBorrowedChains = historicalTotalBorrowedChains.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.totalLiquidityUSD)}
        }
        
        self.historicalchainTvls = historicalchainTvls.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.totalLiquidityUSD) }
        }
    }
}

struct DexProtocolChartModel{
    let historicalFeeChains: [String: [ChartDataEntry]]
    let historicalVolumeChains: [String: [ChartDataEntry]]
    let historicalchainTvls: [String: [ChartDataEntry]]
    
    init?(dto: DexProtocolModel) {
        guard let historicalFeeChains = dto.historicalFeeChains,
              let historicalVolumeChains = dto.historicalVolumeChains,
              let historicalchainTvls = dto.historicalchainTvls
        else {return nil}
        
        self.historicalFeeChains = historicalFeeChains.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.value)}
        }
        
        self.historicalVolumeChains = historicalVolumeChains.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.value)}
        }
        
        self.historicalchainTvls = historicalchainTvls.mapValues { chain in
            chain.map { ChartDataEntry(x: Double($0.date), y: $0.totalLiquidityUSD) }
        }
    }
}

// MARK: Other Types
struct ValueChange{
    let daily, weekly, monthly: Double
}
