//
//  PoolsEndpoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/9/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

enum PoolEndpoint:EndPoint{
    case getPools(name:String)
    
    var path: String {
        switch self {
        case .getPools(let name): return "/poollist/\(name)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getPools( _): return .get
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
