//
//  AppState.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/2/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Combine
import Foundation
import UIKit

enum ProtocolTypes: String {
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
    
    var subID: String {
        return self.rawValue
    }
}


class AppState {
    
    static let shared = AppState()
    private let userDefault = UserDefaults.standard
    
    private let selectedProtocol = CurrentValueSubject<ProtocolTypes,Never>(.unknown)
    var selectedProtocolPublisher: AnyPublisher<ProtocolTypes, Never> {
        selectedProtocol.eraseToAnyPublisher()
    }
    
    private init() {
        if let savedProtocol = userDefault.string(forKey: "selectedProtocol"),
           let protocolType = ProtocolTypes(rawValue: savedProtocol){
            selectedProtocol.send(protocolType)
        }else {
            selectedProtocol.send(.unknown)
        }
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


