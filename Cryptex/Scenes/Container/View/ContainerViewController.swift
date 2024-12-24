//
//  ContainerViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/23/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit
class ContainerViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setInitialPage()
        AppState.shared.containerView = self
    }
    
    private let viewController:[Pages:UIViewController] = [
        .main:MainTabBarViewController(),
        .defi:DeFiViewController(),
        .root:RootViewController()
    ]
    
    private let initialPage:Pages = .root
    
    private func setupUI(){
        viewController.forEach { _,vc in
            addChild(vc)
            view.addSubview(vc.view)
            vc.view.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalTo(view)
            }
            vc.didMove(toParent: self)
            vc.view.isHidden = true
        }
    }
    
    private func setInitialPage() {
        viewController.forEach { page,vc in
            vc.view.isHidden = page != initialPage
        }
    }
    
    func setPage(to page: Pages) {
        let animation = CATransition()
        
        animation.type = .fade
        animation.duration = 0.4
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        view.layer.add(animation, forKey: "slideTransition")
        
        viewController.forEach { enumPage, vc in
            vc.view.isHidden = enumPage != page
        }
    }
}

enum Pages:Int {
    case main
    case defi
    case root
}
