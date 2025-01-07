//
//  BlockchainDetailDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

struct BlockchainDetailDTOModel: Codable {
    let _id: String?
    let address, blockchainName: String?
    let chainTvl: Double?
    let creationDate: String?
    let currentMcap, currentMcapTvl: Double?
    let historicalMcap, historicalMcapTvl: [[Double]]?
    let historicalTvl: [HistoricalTvl]?
    let logo: String?
    let marketShare: Double?
    let overalRisk: String?
    let tvlChanges: Change?
}

struct HistoricalTvl: Codable {
    let date: Int
    let tvl: Double
}

struct Change: Codable {
    let daily, weekly, monthly: Double?
}


