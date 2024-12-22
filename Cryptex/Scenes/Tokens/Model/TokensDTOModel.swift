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
    let symbol: String?
    let `protocol`: String?
    let tokenName, tokenContract: String?
    let tokenPrice: Double?
    let totalVolume: Int?
    let tokenPriceChanges: TokenPriceChanges?
    let currentMCap: Int?
    let chain: String?
    let tokenLogo: String?
    let chainLogo: String?
    let tokenType: String?
    let overalRisk: String?
    let varCvar: VarCvar?
    let varCvarRating: VarCvarRating?
}


struct TokenPriceChanges: Codable {
    let daily, weekly, monthly: Double?
}

struct VarCvar: Codable {
    let varCvarVar, cvar: [String: Double?]?

    enum CodingKeys: String, CodingKey {
        case varCvarVar = "var"
        case cvar
    }
}

struct VarCvarRating: Codable {
    let varCvarRatingVar, cvar: [String: String]?

    enum CodingKeys: String, CodingKey {
        case varCvarRatingVar = "var"
        case cvar
    }
}



