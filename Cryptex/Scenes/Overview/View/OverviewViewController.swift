//
//  OverviewViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class OverviewViewController: BaseSidePageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private lazy var protocolGeneralView = ProtocolGeneralView()
  
    
    private func setupUI(){
        navigationItem.title = "Overview"
        view.addSubview(protocolGeneralView)
        NSLayoutConstraint.activate([
            protocolGeneralView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            protocolGeneralView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            protocolGeneralView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -14),
            protocolGeneralView.heightAnchor.constraint(equalToConstant: 300),
        ])
    }

}
