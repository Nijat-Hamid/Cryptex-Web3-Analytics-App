//
//  PoolsUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/11/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation

enum PoolsUIModels:Hashable{
    case lendingUIModel(LendingUIModel)
    case dexUIModel(DexUIModel)
}

struct DexUIModel:Hashable {
    let id: String
    let symbol: String
    let chain: String
    let apyMean30D: Double
    let overalRisk: String
    let poolLogo: [String]
    let poolPrice: Double
    let protocolChainLogo: String
    let protocolFullName: String
    let protocolLogo: String
    let protocolType: String
    let totalBorrowedTokenUSD, totalLiqiudityUSD: Double
    let tvlUSD: Int
    let utilizationRate: String
}

struct LendingUIModel:Hashable {
    let id: String
    let symbol: String
    let chain: String
    let apyMean30D: Double
    let overalRisk: String
    let poolLogo: [String]
    let poolPrice: Double
    let protocolChainLogo: String
    let protocolFullName: String
    let protocolLogo: String
    let protocolType: String
    let totalBorrowedTokenUSD, totalLiqiudityUSD: Double
    let tvlUSD: Int
    let utilizationRate: String
}

