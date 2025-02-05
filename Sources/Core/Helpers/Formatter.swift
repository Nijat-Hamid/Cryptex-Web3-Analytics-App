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

enum DateFormatType:Hashable {
    case full
    case long
    case medium
    case short
    case custom(String)
    case monthOnly
    case yearOnly
}

struct Formatter {
    // MARK: - Static Formatters
    private static let currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    private static let percentFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    private static let decimalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }()
    
    // MARK: - Number Formatting
    static func number(_ number: Any, as type: FormatType, absolute: Bool = false) -> String {
        let decimalValue: Decimal?
        
        switch number {
        case let num as Decimal:
            decimalValue = num
        case let num as Double:
            decimalValue = num.isFinite ? Decimal(num) : nil
        case let num as Int:
            decimalValue = Decimal(num)
        case let num as Float:
            decimalValue = num.isFinite ? Decimal(floatLiteral: Double(num)) : nil
        case let str as String:
            decimalValue = Decimal(string: str)
        default:
            return "N/A"
        }
        
        guard let value = decimalValue else {
            return "N/A"
        }
        
        let absNumber = abs(value)
        let sign = value < 0 ? "-" : ""
        
        if type == .percentage {
            let formatted = formatValue(absNumber, as: type)
            return absolute ? formatted : "\(sign)\(formatted)"
        }
        
        let formattedNumber: String
        
        switch absNumber {
        case 1_000_000_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000_000_000, as: type) + "T"
        case 1_000_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000_000, as: type) + "B"
        case 1_000_000...:
            formattedNumber = formatValue(absNumber / 1_000_000, as: type) + "M"
        case 1_000...:
            if absNumber < 999_995 {
                formattedNumber = formatValue(absNumber / 1_000, as: type) + "K"
            } else {
                formattedNumber = formatValue(absNumber, as: type)
            }
        default:
            formattedNumber = formatValue(absNumber, as: type)
        }
        
        return absolute ? formattedNumber : "\(sign)\(formattedNumber)"
    }
    
    private static func formatValue(_ value: Decimal, as type: FormatType) -> String {
        switch type {
        case .currency:
            return currencyFormatter.string(for: value)!
        case .percentage:
            return percentFormatter.string(for: value / 100)!
        case .decimal:
            return decimalFormatter.string(for: value)!
        }
    }
    
    // MARK: - Date Formatting
    static func date(_ input: Any, as type: DateFormatType, includeTime: Bool = false) -> String {
        let date: Date
        
        if let timestamp = input as? TimeInterval {
            let isMilliseconds = timestamp > 1_000_000_000_000
            date = Date(timeIntervalSince1970: isMilliseconds ? timestamp / 1000 : timestamp)
        } else if let inputDate = input as? Date {
            date = inputDate
        } else {
            return "N/A"
        }
        
        let formatter: DateFormatter
        switch type {
        case .full:
            formatter = DateFormatter()
            formatter.dateStyle = .full
            formatter.timeStyle = includeTime ? .full : .none
        case .long:
            formatter = DateFormatter()
            formatter.dateStyle = .long
            formatter.timeStyle = includeTime ? .long : .none
        case .medium:
            formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = includeTime ? .medium : .none
        case .short:
            formatter = DateFormatter()
            formatter.dateStyle = .short
            formatter.timeStyle = includeTime ? .short : .none
        case .monthOnly:
            formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
        case .yearOnly:
            formatter = DateFormatter()
            formatter.dateFormat = "yyyy"
        case .custom(let format):
            formatter = DateFormatter()
            formatter.dateFormat = format
        }
        return formatter.string(from: date)

    }
}

