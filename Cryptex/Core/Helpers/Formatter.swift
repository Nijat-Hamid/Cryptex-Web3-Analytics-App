//
//  NumberFormatter.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation

enum FormatType {
    case currency
    case percentage
    case decimal
}

enum DateFormatType {
    case full
    case long
    case medium
    case short
    case custom(String)
    case monthOnly
    case yearOnly
}

struct Formatter {
    static func number(_ number: Double, as type: FormatType,absolute:Bool = false) -> String {
        let absNumber = abs(number)
        let sign = number < 0 ? "-" : ""
        let formattedNumber: String
        
        switch absNumber {
        case 1_000_000_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000_000_000, as: type) + "T"
        case 1_000_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000_000, as: type) + "B"
        case 1_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000, as: type) + "M"
        case 1_000...:
            formattedNumber = formatValue(absNumber / 1_000, as: type) + "K"
        default:
            formattedNumber = formatValue(absNumber, as: type)
        }
        
        let finalReturn = absolute ? "\(formattedNumber)" : "\(sign)\(formattedNumber)"
        return finalReturn
    }
    
    private static func formatValue(_ value: Double, as type: FormatType) -> String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        
        switch type {
        case .currency:
            formatter.numberStyle = .currency
            formatter.currencyCode = "USD"
        case .percentage:
            formatter.numberStyle = .percent
            return formatter.string(for: value / 100) ?? "N/A"
        case .decimal:
            formatter.numberStyle = .decimal
            
        }
        
        return formatter.string(for: value) ?? "N/A"
    }
    
    static func date(_ input: Any, as type: DateFormatType, includeTime: Bool = false) -> String {
        let formatter = DateFormatter()
        var date: Date
        
        if let timestamp = input as? TimeInterval {
            let isMilliseconds = timestamp > 1_000_000_000_000
            date = Date(timeIntervalSince1970: isMilliseconds ? timestamp / 1000 : timestamp)
        } else if let inputDate = input as? Date {
            date = inputDate
        } else {
            return "Invalid input"
        }
        
        switch type {
        case .full:
            formatter.dateStyle = .full
            formatter.timeStyle = includeTime ? .full : .none
        case .long:
            formatter.dateStyle = .long
            formatter.timeStyle = includeTime ? .long : .none
        case .medium:
            formatter.dateStyle = .medium
            formatter.timeStyle = includeTime ? .medium : .none
        case .short:
            formatter.dateStyle = .short
            formatter.timeStyle = includeTime ? .short : .none
        case .monthOnly:
            formatter.dateFormat = "MMMM yyyy"
        case .yearOnly:
            formatter.dateFormat = "yyyy"
        case .custom(let format):
            formatter.dateFormat = format
        }
        return formatter.string(from: date)
    }
}

