//
//  NumberFormatter.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation
import UIKit

enum FormatType {
    case currency 
    case percentage
    
}

struct Formatter {
    static func format(_ number: Double, as type: FormatType) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        
        switch type {
        case .currency:
            formatter.numberStyle = .currency
            formatter.currencyCode = "USD"
        case .percentage:
            formatter.numberStyle = .percent
        }
        
        let absNumber = abs(number)
        let sign = absNumber < 0 ? "-" : ""
        
        switch absNumber {
        case 1_000_000_000_000...:
            return "\(sign)\(formatter.string(for: absNumber / 1_000_000_000_000) ?? "")T"
        case 1_000_000_000...:
            return "\(sign)\(formatter.string(for: absNumber / 1_000_000_000) ?? "")B"
        case 1_000_000...:
            return "\(sign)\(formatter.string(for: absNumber / 1_000_000) ?? "")M"
        case 1_000...:
            return "\(sign)\(formatter.string(for: absNumber / 1_000) ?? "")K"
        default:
            if type == .percentage {
                let formattedPercentage = formatter.string(for: absNumber / 100) ?? ""
                return "\(sign)\(formattedPercentage)"
            }
            return "\(sign)\(formatter.string(for: absNumber) ?? "")"
        }
    }
}
