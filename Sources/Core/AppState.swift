//
//  AppState.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/2/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Combine
import Foundation

final class AppState {
    
    static let shared = AppState()
    private let userDefault = UserDefaults.standard
    
    private let selectedProtocol = CurrentValueSubject<ProtocolTypes,Never>(.unknown)
    
    var selectedProtocolPublisher: AnyPublisher<ProtocolTypes, Never> {
        selectedProtocol.eraseToAnyPublisher()
    }
    
    private let protocolChain = CurrentValueSubject<ProtocolChains,Never>(.ethereum)
    
    var selectedChain:AnyPublisher<ProtocolChains.RawValue,Never> {
        protocolChain.map { $0.chainID }.eraseToAnyPublisher()
    }
    
    private init() {
        if let savedProtocol = userDefault.string(forKey: "selectedProtocol"),
           let protocolType = ProtocolTypes(rawValue: savedProtocol){
            selectedProtocol.send(protocolType)
        }else {
            selectedProtocol.send(.unknown)
        }
    }
    
    func setChain (with chain:ProtocolChains){
        protocolChain.send(chain)
    }
    
    func resetChain (){
        protocolChain.send(.ethereum)
    }
    
    func setProtocolID (with protocolType: ProtocolTypes) {
        selectedProtocol.send(protocolType)
        userDefault.set(protocolType.rawValue, forKey: "selectedProtocol")
    }
    
    
    func resetProtocolID (){
        userDefault.removeObject(forKey: "selectedProtocol")
        selectedProtocol.send(.unknown)
    }
    
    func getInitialProtocolID() -> ProtocolTypes {
        if let savedProtocolID = userDefault.string(forKey: "selectedProtocol"),
           let protocolType = ProtocolTypes(rawValue: savedProtocolID){
            return protocolType
        }else {
            return .unknown
        }
        
    }
}

enum ProtocolTypes: String, CaseIterable {
    case aaveV2 = "aave-v2"
    case aaveV3 = "aave-v3"
    case uniswapV2 = "uniswap-v2"
    case uniswapV3 = "uniswap-v3"
    case unknown = ""
    
    var id: String {
        switch self {
        case .aaveV2, .aaveV3:
            return "aave"
        case .uniswapV2, .uniswapV3:
            return "uniswap"
        case .unknown:
            return ""
        }
    }
    
    var cleanSubID:String {
        switch self {
        case .aaveV2: return "Aave v2"
        case .aaveV3: return "Aave v3"
        case .uniswapV2: return "Uniswap v2"
        case .uniswapV3: return "Uniswap v3"
        case .unknown: return ""
        }
    }
    
    var subID: String {
        return self.rawValue
    }
}


enum ProtocolChains:String {
    case ethereum = "Ethereum"
    case polygon = "Polygon"
    case avalanche = "Avalanche"
    case arbitrum = "Arbitrum"
    case binance = "Binance"
    case base = "Base"
    case optimism = "Optimism"
    case celo = "Celo"
    case moonbeam = "Moonbeam"
    case fantom = "Fantom"
    case harmony = "Harmony"
    case metis = "Metis"
    
    var chainID:String{
        return self.rawValue
    }
}
