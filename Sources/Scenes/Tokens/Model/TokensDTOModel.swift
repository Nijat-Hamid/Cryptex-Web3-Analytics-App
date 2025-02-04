//
//  TokensDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

typealias TokensDTOModel = [SingleToken]

struct SingleToken: Codable {
    let tokenName: String?
    let tokenPrice, totalVolume: Double?
    let tokenPriceChanges: TokenPriceChanges?
    let currentMCap: Double?
    let chain, tokenLogo, chainLogo, overalRisk,`protocol`,tokenContract: String?
}

struct TokenPriceChanges: Codable {
    let daily, weekly, monthly: Double?
}





