//
//  ContainerState.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/15/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

class ContainerState {
    static let shared = ContainerState()
    
    private init(){}
    
    private lazy var containerView:ContainerViewController = ContainerViewController()
    
    func setPage(to page: Pages) {
        containerView.setPage(to: page)
    }
    
}
