//
//  UILabel+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/13/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

extension UILabel {
    func updateColorBasedOnRisk(rating:String) {
        self.text = rating
        let colors = ColorBased.forRisk(rating)
        self.textColor = colors.textColor
        self.layer.borderColor = colors.borderColor?.cgColor
        self.layer.backgroundColor = colors.backgroundColor?.cgColor
    }
    
    func updateColorBasedOnChanges<T: SignedNumeric & Comparable>(_ value: T) {
        let valueStyle = ColorBased.forChanges(value: value)
        self.text = valueStyle.text
        self.textColor = valueStyle.textColor
    }
    
}
