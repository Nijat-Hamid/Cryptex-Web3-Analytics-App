//
//  TokenDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/8/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation

struct TokenDetailDTOModel: Codable {
    let tokenName, tokenContract: String?
    let tokenPrice: Double?
    let tokenPriceChanges: PriceChange?
    let holders, currentMCap: Double?
    let currentMCapChanges: PriceChange?
    let historicalMCap, historicalPrice: [[Double]]?
    let chain, tokenLogo, chainLogo, overalRisk: String?
    let date: String?
    let totalTx: Double?
}

struct PriceChange: Codable {
    let daily, weekly, monthly: Double?
}
