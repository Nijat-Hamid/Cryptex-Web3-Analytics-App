//
//  RootViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/28/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import UIKit

class RootViewModel:NSObject {
    private let data: [RootItemViewModel] = [
        RootItemViewModel(id: "aave", imageName: "aave", description: "Aave is a decentralized non-custodial liquidity market protocol where users can participate as suppliers or borrowers"),
        RootItemViewModel(id: "uniswap", imageName: "uniswap", description: "Uniswap is a decentralized cryptocurrency exchange that uses a set of smart contracts (liquidity pools) to execute trades on its exchange.")
    ]
    
    var rootData: [RootItemViewModel] {
        return data
    }
}
