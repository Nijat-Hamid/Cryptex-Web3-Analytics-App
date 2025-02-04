//
//  Router.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/13/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

final class Router{
    private init () {}
    
    static func tabbarViewController(for type:TabbarControllerType) -> UIViewController {
        switch type {
        case .overview:
            return OverviewVC()
        case .pools:
            return PoolsVC()
        case .tokens:
            return TokensVC()
        case .blockchains:
            return BlockchainsVC()
        case .metrics:
            return MetricsVC()
        }
    }
}
