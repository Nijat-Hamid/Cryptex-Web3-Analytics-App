//
//  ProtocolDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/25/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation


enum OverviewCombinedDTOModel:Codable{
    case lendingModel(LendingProtocolModel)
    case dexModel(DexProtocolModel)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let lendingModel = try? container.decode(LendingProtocolModel.self),
           lendingModel.type == "Lending"{
            self = .lendingModel(lendingModel)
        } else if let dexModel = try? container.decode(DexProtocolModel.self),
                  dexModel.type == "Dex"{
            self = .dexModel(dexModel)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Data matches neither lending nor dex model format"
            )
        }
    }
}

// MARK: - DexProtocolModel
struct DexProtocolModel:Codable {
    let _id: String?
    let averageApy: [String: Decimal]?
    let contract, creationDate: [String: String]?
    let currentChainTvls: [String: Decimal]?
    let fee: Fee?
    let feeChanges: ProtocolChanges?
    let historicalFeeChains, historicalVolumeChains: [String: [HistoricalFeeVolumeChains]]?
    let historicalVolumeChanges: ProtocolChanges?
    let historicalchainTvls: [String: [HistoricalAmountChain]]?
    let logo: String?
    let overalRisk: [String: String]?
    let parentProtocol: String?
    let poolsNumber: [String: Decimal]?
    let selectChains, selectProtocols: [Select]?
    let tvl: Decimal?
    let type: String?
    let volumeTotal24h: Decimal?
    let chainTvlChanges:[String:ProtocolChanges]?
    let historicalTvlChanges:ProtocolChanges?
    let timeRisk:String?
}


// MARK: - LendingProtocolModel
struct LendingProtocolModel:Codable {
    let _id: String?
    let averageApy: [String: Decimal]?
    let contract, creationDate: [String: String]?
    let currentChainTvls: [String: Decimal]?
    let currentTotalBorrowed: Decimal?
    let historicalDepositAmountChanges: ProtocolChanges?
    let historicalDepositedAmountChain, historicalTotalBorrowedChains: [String: [HistoricalAmountChain]]?
    let historicalTotalBorrowedChanges: ProtocolChanges?
    let historicalchainTvls: [String: [HistoricalAmountChain]]?
    let logo: String?
    let overalRisk: [String: String]?
    let parentProtocol: String?
    let poolsNumber: [String: Decimal]?
    let selectChains, selectProtocols: [Select]?
    let totalDepositedAmountAll, tvl: Decimal?
    let type: String?
    let chainTvlChanges:[String:ProtocolChanges]?
    let historicalTvlChanges:ProtocolChanges?
    let timeRisk:String?
}

// MARK: - Fee
struct Fee:Codable {
    let total24h: Decimal
}

// MARK: - Arbitrum
struct HistoricalFeeVolumeChains:Codable {
    let date: Int
    let value: Double
}

// MARK: - Changes
struct ProtocolChanges:Codable {
    let daily, weekly, monthly: Double
}

// MARK: - HistoricalDepositedAmountChain
struct HistoricalAmountChain:Codable {
    let date: Int
    let totalLiquidityUSD: Double
}


// MARK: - Select
struct Select:Codable {
    let id: Int
    let label: String
    let `default`: Bool
    let value, img: String
}
