//
//  PoolsDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/25/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class PoolsDetailViewController: BaseHidesTabBarViewController {

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
    
    var protocolName:String?
    var poolChain:String?
    var poolContract:String?
    
    private lazy var poolInfoView = PoolInfoView()
    private lazy var poolsChart = PoolChartView()
    
    private func setupUI(){
        view.addSubview(poolInfoView)
        view.addSubview(poolsChart)
        NSLayoutConstraint.activate([
            poolInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            poolInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            poolInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            poolsChart.topAnchor.constraint(equalTo: poolInfoView.bottomAnchor, constant: 12),
            poolsChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            poolsChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            poolsChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
}
