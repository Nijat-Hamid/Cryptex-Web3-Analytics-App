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
    let id, chain: String?
    let protocolName: [String]?
    let blockchainName: String?
    let chainTvl: Double?
    let logo: String?
    let marketShare: Double?
    let overalRisk: String?
    let tvlChanges: TvlChanges?
    let protocolSlugs: [String]?
    let explorer: String?
    let tvlByProtocols: [String: [[Double]]]?

}

struct TvlChanges: Codable {
    let daily, weekly, monthly: Double?
}


