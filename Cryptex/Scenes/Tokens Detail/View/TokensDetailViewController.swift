//
//  TokensDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class TokensDetailViewController: BaseHidesTabBarViewController {

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
    private lazy var tokenInfoView = TokenInfoView()
    private lazy var tokensChart = TokenChartView()
    
    private func setupUI(){
        view.addSubview(tokenInfoView)
        view.addSubview(tokensChart)
        NSLayoutConstraint.activate([
            tokenInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            tokenInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            tokenInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            tokensChart.topAnchor.constraint(equalTo: tokenInfoView.bottomAnchor, constant: 12),
            tokensChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            tokensChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            tokensChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}
