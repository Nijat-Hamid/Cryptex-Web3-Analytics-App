//
//  ProtocolEndpoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/27/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

enum OverviewEndpoint:EndPoint{
    case getProtocol(name:String)
    
    var path: String {
        switch self {
        case .getProtocol(let name): return "/protocols/\(name)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getProtocol( _): return .get
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
