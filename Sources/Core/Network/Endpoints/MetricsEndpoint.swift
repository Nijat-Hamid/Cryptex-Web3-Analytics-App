//
//  MetricsEndpoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/8/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

enum MetricsEndpoint:EndPoint{
    case getMetrics(name:String)
    
    var path: String {
        switch self {
        case .getMetrics(let name): return "/metrics/\(name)"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .getMetrics(_): return .get
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
