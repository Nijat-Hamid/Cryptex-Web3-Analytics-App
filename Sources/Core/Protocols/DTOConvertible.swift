//
//  DTOConvertible.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

protocol DTOConvertible {
    associatedtype DTO
    init?(dto: DTO)
}
