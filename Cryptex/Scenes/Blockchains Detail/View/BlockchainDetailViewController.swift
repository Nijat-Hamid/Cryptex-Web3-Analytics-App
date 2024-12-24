//
//  BlockchainDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BlockchainDetailViewController: BaseHidesTabBarViewController {
    
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
    private lazy var blockchainInfoView = BlockchainInfoView()
    private lazy var blockchainChart = BlockchainChartView()
    
    private func setupUI(){
        view.addSubview(blockchainInfoView)
        view.addSubview(blockchainChart)
        NSLayoutConstraint.activate([
            blockchainInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            blockchainInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            blockchainInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            blockchainChart.topAnchor.constraint(equalTo: blockchainInfoView.bottomAnchor, constant: 12),
            blockchainChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            blockchainChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            blockchainChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}
