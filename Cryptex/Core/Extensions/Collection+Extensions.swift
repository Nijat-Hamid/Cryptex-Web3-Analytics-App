//
//  Collection+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/25/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

extension Collection {
    subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
