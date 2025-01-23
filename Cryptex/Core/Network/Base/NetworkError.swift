//
//  NetworkError.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

public enum NetworkError: Error {
    case decode
    case generic
    case invalidURL
    case noResponse
    case unauthorized
    case unexpectedStatusCode
    case unknown
    case networkFailure(Error)
    case modelTransformFailure
    
    public var message: String {
        switch self {
        case .decode:
            return "Decode Error"
        case .generic:
            return "Generic Error"
        case .invalidURL:
            return "Invalid URL Error"
        case .noResponse:
            return "No Response"
        case .unauthorized:
            return "Unauthorized URL"
        case .unexpectedStatusCode:
            return "Status Code Error"
        case .networkFailure(let error):
            return error.localizedDescription
        case .modelTransformFailure:
            return "DTO to UI Model Transformation Error"
        default:
            return "Unknown Error"
        }
    }
}
