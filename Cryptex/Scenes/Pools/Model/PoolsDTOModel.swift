//
//  PoolsDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/12/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//


import Foundation

enum PoolsDTOModels{
    case lendingModel(PoolsLendingDTOModel)
    case dexModel(PoolsDexDTOModel)
}

typealias PoolsLendingDTOModel = [LendingModel]
typealias PoolsDexDTOModel = [DexModel]

struct LendingModel: Codable,Hashable {
    let id: String?
    let project: String?
    let symbol: String?
    let chain: String?
    let apyMean30D: Double?
    let historicalTvlChanges: HistoricalTvlChanges?
    let overalRisk: String?
    let poolContract: String?
    let poolLogo: [String]?
    let poolMeta: String?
    let poolPrice: Double?
    let protocolChainLogo: String?
    let protocolFullName: String?
    let protocolLogo: String?
    let protocolName: String?
    let protocolType: String?
    let totalBorrowedTokenUSD, totalLiqiudityUSD: Double?
    let tvlUSD: Int?
    let utilizationRate: String?
}

struct HistoricalTvlChanges: Codable,Hashable {
    let daily, weekly, monthly: Double?
}

struct DexModel: Codable,Hashable {
    let id: String?
    let project: String?
    let symbol, chain: String?
    let apyMean30D: Double?
    let currentFee, currentVolume: String?
    let feeTier: String?
    let feeTvl: Double?
    let historicalTvlChanges: HistoricalTvlChange?
    let overalRisk: String?
    let poolContract: String?
    let poolLogo: [String]?
    let poolMeta: String?
    let poolName, protocolChainLogo: String?
    let protocolFullName: String?
    let protocolLogo: String?
    let protocolName: String?
    let protocolType: String?
    let tradingFee: Double?
    let tvlUSD: Int?
    let volTvl: Double?
}
struct HistoricalTvlChange: Codable,Hashable {
    let daily, weekly, monthly: Double?
}



