//
//  PoolsDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/12/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

enum PoolsCombinedDTOModel:Codable{
    case lendingModel(PoolsLendingDTOModel)
    case dexModel(PoolsDexDTOModel)
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        if let lendingModels = try? container.decode(PoolsLendingDTOModel.self),
           lendingModels.contains(where: { $0.utilizationRate != nil }) {
            self = .lendingModel(lendingModels)
        } else if let dexModels = try? container.decode(PoolsDexDTOModel.self) {
            self = .dexModel(dexModels)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Data matches neither lending nor dex model format"
            )
        }
    }
    
}

typealias PoolsLendingDTOModel = [LendingModel]
typealias PoolsDexDTOModel = [DexModel]

struct LendingModel: Codable,Hashable {
    let _id: String?
    let project: String?
    let chain: String?
    let apyMean30d: Double?
    let overalRisk: String?
    let poolContract: String?
    let poolLogo: [String]?
    let poolPrice: Double?
    let protocolChainLogo: String?
    let protocolFullName: String?
    let protocolLogo: String?
    let totalBorrowedTokenUSD, totalLiqiudityUSD: Double?
    let tvlUSD: Double?
    let utilizationRate: String?
    let symbol:String?
}

struct DexModel: Codable,Hashable {
    let _id: String?
    let project: String?
    let chain: String?
    let apyMean30d: Double?
    let overalRisk: String?
    let poolContract: String?
    let poolLogo: [String]?
    let tradingFee: Double?
    let protocolChainLogo: String?
    let protocolFullName: String?
    let protocolLogo: String?
    let tvlUSD: Double?
    let currentFee: String?
    let currentVolume: String?
    let poolName: String?
    let volTvl: Double?
    let symbol:String?
}













