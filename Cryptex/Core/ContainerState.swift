//
//  ContainerState.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/15/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

class ContainerState {
    
    static let shared = ContainerState()
    private init(){}
    
    var container:UIViewController{
        return containerView
    }
    
    private lazy var containerView:ContainerViewController = {
        let vc = ContainerViewController()
        vc.initialPage = .root
        return vc
    }()
    
    func setPage(to page: Pages) {
        let animation = Transitions.fade(duration: 0.4)
        
        if page != .main, let mainTabBar = containerView.viewController[.main] as? MainTabBarViewController {
            mainTabBar.viewControllers?.forEach { vc in
                if let navController = vc as? AppNavigationController {
                    navController.popToRootViewController(animated: true)
                }
            }
            mainTabBar.selectedIndex = 0
        }
        
        containerView.view.layer.add(animation, forKey: "slideTransition")
        containerView.viewController.forEach { enumPage, vc in
            vc.view.isHidden = enumPage != page
        }
    }
}
