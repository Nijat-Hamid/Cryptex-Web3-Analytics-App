//
//  MetricsDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/18/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation

struct MetricsDTOModel:Codable {
    let _id: String?
    let athChange, atlChange, circulatingMarketCap, currentAth: Double?
    let currentAtl: Double?
    let currentMarketSupply, currentMaxSuply: Double?
    let dulitedMarketCap: Double?
    let fee: FeeRev?
    let historicalMcapNative, historicalMcapTvl, historicalPriceNative: [[Double]]?
    let marketShare: Double?
    let revenue: FeeRev?
    let psRatio: Decimal?
    let pfRatio: Decimal?
}

struct FeeRev:Codable {
    let total7d: Decimal?
}
