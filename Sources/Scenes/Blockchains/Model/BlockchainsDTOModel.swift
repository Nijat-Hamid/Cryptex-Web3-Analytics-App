//
//  BlockchainsDTOModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//


import Foundation

typealias BlockchainsDTOModel = [SingleBlockchain]

struct SingleBlockchain: Codable {
    let _id: String?
    let blockchainName: String?
    let chainTvl: Double?
    let marketShare: Double?
    let overalRisk: String?
    let tvlChanges: TvlChanges?
    let logo: String?
    let chain: String?
}

struct TvlChanges: Codable {
    let daily, weekly, monthly: Double?
}


