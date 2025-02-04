//
//  BlockchainEndpoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

enum BlockchainEndpoint:EndPoint {
    case getBlockchains(name:String)
    case getSingleBlockchain(name:String)
    
    var path: String {
        switch self {
        case .getBlockchains(let name): return "/chainlist/\(name)"
        case .getSingleBlockchain(let name): return "/chaindetail/\(name)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getBlockchains( _): return .get
        case .getSingleBlockchain( _): return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
    
    var queryParams: [String : String]? {
        return nil
    }
    
    var pathParams: [String : String]? {
        return nil
    }
}
