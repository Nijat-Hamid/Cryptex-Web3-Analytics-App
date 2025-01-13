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
            return OverviewViewController()
        case .pools:
            return PoolsViewController()
        case .tokens:
            return TokensViewController()
        case .blockchains:
            return BlockchainsViewController()
        case .metrics:
            return MetricsViewController()
        }
    }
}
