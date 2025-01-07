//
//  BaseTransitionViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BaseBackgroundViewController: BaseViewController {
        
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupUI(){
        view.backgroundColor = .background
    }
}

