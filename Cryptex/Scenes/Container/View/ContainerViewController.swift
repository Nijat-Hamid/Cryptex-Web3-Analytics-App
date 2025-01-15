//
//  ContainerViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/23/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit

enum Pages:Int {
    case main
    case defi
    case root
}


class ContainerViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setInitialPage()
    }
    
      let viewController:[Pages:UIViewController] = [
        .main:MainTabBarViewController(),
        .defi:DeFiViewController(),
        .root:RootViewController()
    ]
    
    var initialPage:Pages?
    
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
    
}
