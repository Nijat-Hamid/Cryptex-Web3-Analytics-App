//
//  PoolsUIModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/9/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

enum PoolsCombinedUIModel:Hashable{
    case lendingUIModel([PoolsLendingUIModel])
    case dexUIModel([PoolsDexUIModel])
}

enum PoolsCombinedSingleUIModel:Hashable{
    case lendingUIModel(PoolsLendingUIModel)
    case dexUIModel(PoolsDexUIModel)
}

struct PoolsLendingUIModel:Hashable,DTOConvertible{
    let _id: String
    let project: String
    let chain: String
    let apyMean30d: Double
    let overalRisk: String
    let poolContract: String
    let poolLogo: [String]
    let poolPrice: Double
    let protocolChainLogo: String
    let protocolFullName: String
    let protocolLogo: String
    let totalBorrowedTokenUSD, totalLiqiudityUSD: Double
    let tvlUSD: Double
    let utilizationRate: String
    let symbol:String
    
    init?(dto: LendingModel) {
        guard let _id = dto._id,
              let project = dto.project,
              let chain = dto.chain,
              let apyMean30d = dto.apyMean30d,
              let overalRisk = dto.overalRisk,
              let poolContract = dto.poolContract,
              let poolLogo = dto.poolLogo,
              let poolPrice = dto.poolPrice,
              let protocolChainLogo = dto.protocolChainLogo,
              let protocolFullName = dto.protocolFullName,
              let protocolLogo = dto.protocolLogo,
              let totalBorrowedTokenUSD = dto.totalBorrowedTokenUSD,
              let totalLiqiudityUSD = dto.totalLiqiudityUSD,
              let tvlUSD = dto.tvlUSD,
              let utilizationRate = dto.utilizationRate,
              let symbol = dto.symbol
        else {return nil}
        
        self._id = _id
        self.project = project
        self.chain = chain
        self.apyMean30d = apyMean30d
        self.overalRisk = overalRisk
        self.poolContract = poolContract
        self.poolLogo = poolLogo
        self.poolPrice = poolPrice
        self.protocolChainLogo = protocolChainLogo
        self.protocolFullName = protocolFullName
        self.protocolLogo = protocolLogo
        self.totalBorrowedTokenUSD = totalBorrowedTokenUSD
        self.totalLiqiudityUSD = totalLiqiudityUSD
        self.tvlUSD = tvlUSD
        self.utilizationRate = utilizationRate
        self.symbol = symbol
    }
}

struct PoolsDexUIModel:Hashable,DTOConvertible{
    let _id: String
    let project: String
    let chain: String
    let apyMean30d: Double
    let overalRisk: String
    let poolContract: String
    let poolLogo: [String]
    let tradingFee: Double
    let protocolChainLogo: String
    let protocolFullName: String
    let protocolLogo: String
    let tvlUSD: Double
    let currentFee: String
    let currentVolume: String
    let poolName: String
    let volTvl: Double
    let symbol:String
    
    init?(dto: DexModel) {
        guard let _id = dto._id,
              let project = dto.project,
              let chain = dto.chain,
              let apyMean30d = dto.apyMean30d,
              let overalRisk = dto.overalRisk,
              let poolContract = dto.poolContract,
              let poolLogo = dto.poolLogo,
              let tradingFee = dto.tradingFee,
              let protocolChainLogo = dto.protocolChainLogo,
              let protocolFullName = dto.protocolFullName,
              let protocolLogo = dto.protocolLogo,
              let tvlUSD = dto.tvlUSD,
              let symbol = dto.symbol,
              let currentFee = dto.currentFee,
              let poolName = dto.poolName,
              let currentVolume = dto.currentVolume,
              let volTvl = dto.volTvl
        else {return nil}
        
        self._id = _id
        self.project = project
        self.chain = chain
        self.apyMean30d = apyMean30d
        self.overalRisk = overalRisk
        self.poolContract = poolContract
        self.poolLogo = poolLogo
        self.tradingFee = tradingFee
        self.protocolChainLogo = protocolChainLogo
        self.protocolFullName = protocolFullName
        self.protocolLogo = protocolLogo
        self.tvlUSD = tvlUSD
        self.symbol = symbol
        self.currentFee = currentFee
        self.poolName = poolName
        self.currentVolume = currentVolume
        self.volTvl = volTvl
    }
}
