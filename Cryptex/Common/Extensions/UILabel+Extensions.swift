//
//  UILabel+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/13/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

extension UILabel {
    func updateColorBasedOnRisk() {
        switch self.text {
        case "A":
            self.textColor = .riskAPrimary
            self.layer.borderColor = UIColor.riskAPrimary.cgColor
            self.layer.backgroundColor = UIColor.riskASecondary.cgColor
        case "B":
            self.textColor = .riskBPrimary
            self.layer.borderColor = UIColor.riskBPrimary.cgColor
            self.layer.backgroundColor = UIColor.riskBSecondary.cgColor
        case "C":
            self.textColor = .riskCPrimary
            self.layer.borderColor = UIColor.riskCPrimary.cgColor
            self.layer.backgroundColor = UIColor.riskCSecondary.cgColor
        case "D":
            self.textColor = .riskDPrimary
            self.layer.borderColor = UIColor.riskDPrimary.cgColor
            self.layer.backgroundColor = UIColor.riskDSecondary.cgColor
        case "F":
            self.textColor = .riskFPrimary
            self.layer.borderColor = UIColor.riskFPrimary.cgColor
            self.layer.backgroundColor = UIColor.riskFSecondary.cgColor
        default:
            self.textColor = .label
        }
    }
}
