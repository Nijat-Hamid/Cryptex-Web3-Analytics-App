//
//  TokenEndpoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/7/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

enum TokenEndpoint:EndPoint{
    case getTokens(name:String)
    case getSingleToken(contract:String,name:String,chain:String)
    
    var path: String {
        switch self {
        case .getTokens(let name): return "/tokenlist/\(name)"
        case .getSingleToken(let contract,let name,let chain): return "/tokendetail/\(name)/\(chain)/\(contract)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getTokens( _): return .get
        case .getSingleToken(_,_,_): return .get
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
