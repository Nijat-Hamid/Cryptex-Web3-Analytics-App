//
//  TokensDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class TokensDetailViewController: BaseLoadingViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupUI(){
        navigationItem.title = "Details"
    }

}
