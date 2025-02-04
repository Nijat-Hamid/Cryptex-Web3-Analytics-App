//
//  NetworkError.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

public enum NetworkError: Error {
    case decode
    case invalidURL
    case noResponse
    case unauthorized
    case unknown
    case modelTransformFailure
    case badRequest
    case forbidden
    case server
    case noConnection
    case timeout
    
    public var message: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .badRequest:
            return "Bad Request Error"
        case .invalidURL:
            return "Invalid URL Error"
        case .noResponse:
            return "No Response"
        case .unauthorized:
            return "Unauthorized URL"
        case .modelTransformFailure:
            return "DTO to UI Model Transformation Error"
        case .forbidden:
            return "Forbidden Request Error"
        case .server:
            return "Server Error"
        case .noConnection:
            return "No Internet Connection"
        case .timeout:
            return "Timeout Error"
        default:
            return "Unknown Error"
        }
    }
}
