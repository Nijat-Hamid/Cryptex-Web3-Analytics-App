//
//  TokensUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation

struct TokensUIModel:Hashable {
    let id = UUID()
    let chainLogo: String
    let chain: String
    let currentMCap: Int
    let overalRisk: String
    let tokenType: String
    let tokenPrice: Double
    let totalVolume: Int
    let tokenPriceChanges: TokenPriceChange
}

struct TokenPriceChange: Hashable {
    let daily, weekly, monthly: Double
}
