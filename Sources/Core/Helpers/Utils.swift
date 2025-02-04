//
//  Utils.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/23/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import UIKit

struct Utils{
    static func calculateTextWidth(text: String, font: UIFont) -> CGFloat {
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        let size = (text as NSString).size(withAttributes: attributes)
        return size.width
    }
}
