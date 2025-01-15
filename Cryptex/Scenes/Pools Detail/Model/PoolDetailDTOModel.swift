//
//  PoolsDetailDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/15/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation

enum PoolsDetailCombinedDTOModel:Codable {
    case detailLendingModel(DetailLendingDTOModel)
    case detailDexModel(DetailDexDTOModel)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let dexModels = try? container.decode(DetailDexDTOModel.self),
           dexModels.tradingFee != nil {
            self = .detailDexModel(dexModels)
        } else if let lendingModels = try? container.decode(DetailLendingDTOModel.self) {
            self = .detailLendingModel(lendingModels)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Data matches neither lending nor dex model format"
            )
        }
    }
}

struct DetailLendingDTOModel:Codable {
    let _id, symbol: String?
    let apy: Double?
    let historicalApyTvl: [HistoricalApyTvl]?
    let historicalTvlChanges: HistoricalTvlChanges?
    let overalRisk, poolContract: String?
    let poolDepositors: Double?
    let poolLogo: [String]?
    let poolPrice: Double?
    let protocolChainLogo: String?
    let tvlUSD: Double?
    let date: String?
    let totalTx: Double?
    let protocolFullName:String?
    let protocolLogo:String?
    let chain:String?
}

struct DetailDexDTOModel:Codable {
    let _id, symbol: String?
    let apy: Double?
    let historicalApyTvl: [HistoricalApyTvl]?
    let historicalTvlChanges: HistoricalTvlChanges?
    let overalRisk, poolContract: String?
    let poolDepositors: Double?
    let poolLogo: [String]?
    let poolName, protocolChainLogo: String?
    let tradingFee, tvlUSD: Double?
    let date: String?
    let totalTx: Double?
    let protocolFullName:String?
    let protocolLogo:String?
    let chain:String?
}


struct HistoricalApyTvl:Codable {
    let timestamp: Double
    let tvlUsd: Double
    let apy: Double
}

struct HistoricalTvlChanges:Codable {
    let daily, weekly, monthly: Double?
}

