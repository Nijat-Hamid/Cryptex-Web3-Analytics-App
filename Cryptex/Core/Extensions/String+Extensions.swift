//
//  String+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

extension String {
    func truncateMiddle(maxLength: Int) -> String {
        guard self.count > maxLength else { return self }
        
        let prefixLength = maxLength / 2
        let suffixLength = maxLength - prefixLength - 3
        
        let prefix = self.prefix(prefixLength)
        let suffix = self.suffix(suffixLength)
        
        return "\(prefix)...\(suffix)"
    }
}
