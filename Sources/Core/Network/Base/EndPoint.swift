//
//  EndPoint.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

public protocol EndPoint {
    var host: String { get }
    var scheme: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var queryParams: [String: String]? { get } // Added for query parameters
    var pathParams: [String: String]? { get }  // Added for path parameters
}

extension EndPoint {
    var scheme: String {
        return "https"
    }
    var host: String {
        return Constants.baseApiUrl
    }
}
