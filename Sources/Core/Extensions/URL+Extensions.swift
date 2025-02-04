//
//  URL+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/28/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Foundation
extension URL {
    static func fromBase(_ path: String) -> URL? {
        let updatedPath = path.replacingOccurrences(of: ".svg", with: ".png")
        return URL(string: Constants.baseImgUrl + updatedPath)
    }
}
