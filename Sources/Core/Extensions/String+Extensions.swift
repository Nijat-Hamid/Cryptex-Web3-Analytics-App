//
//  String+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation

extension String {
    func truncateMiddle(maxLength: Int, minLength:Int = 6) -> String {
        guard self.count > maxLength,self.count > minLength else { return self }
                
        let prefixLength = maxLength / 2
        let suffixLength = max(0, maxLength - prefixLength - 3) 
        
        let prefix = self.prefix(prefixLength)
        let suffix = self.suffix(suffixLength)
        
        return "\(prefix)...\(suffix)"
    }
}
