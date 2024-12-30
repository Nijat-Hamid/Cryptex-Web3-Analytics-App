//
//  Helpers.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import UIKit

struct ColorBased {
    static func forRisk(_ rating: String) -> (textColor: UIColor, borderColor: UIColor?, backgroundColor: UIColor?) {
        switch rating {
        case "A":
            return (textColor: .riskAPrimary, borderColor: .riskAPrimary, backgroundColor: .riskASecondary)
        case "B":
            return (textColor: .riskBPrimary, borderColor: .riskBPrimary, backgroundColor: .riskBSecondary)
        case "C":
            return (textColor: .riskCPrimary, borderColor: .riskCPrimary, backgroundColor: .riskCSecondary)
        case "D":
            return (textColor: .riskDPrimary, borderColor: .riskDPrimary, backgroundColor: .riskDSecondary)
        case "F":
            return (textColor: .riskFPrimary, borderColor: .riskFPrimary, backgroundColor: .riskFSecondary)
        default:
            return (textColor: .foreground, borderColor: .foreground, backgroundColor: nil)
        }
    }
    
    static func forChanges<T: SignedNumeric & Comparable>(value: T) -> (text: String, textColor: UIColor) {
        let absoluteValue = abs(value)
        let text = "\(absoluteValue)%"
        let textColor: UIColor = value > 0 ? .brandGreen : (value < 0 ? .brandRed : .foreground)
        
        return (text, textColor)
    }
    
    
}
