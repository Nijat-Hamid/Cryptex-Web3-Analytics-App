//
//  Array+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

extension Array {
    func toUIModels<T: DTOConvertible>() -> [T] where T.DTO == Element {
        self.compactMap { T(dto: $0) }
    }
}
