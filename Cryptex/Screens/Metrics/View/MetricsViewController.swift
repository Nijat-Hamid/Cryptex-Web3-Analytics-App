//
//  MetricsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MetricsViewController: BaseViewController {

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
    
    private lazy var metricsCardView = MetricsCardView()
    private lazy var metricsChart = MetricsChart()
    
    private func setupUI(){
        navigationItem.title = "Metrics"
        view.addSubview(metricsCardView)
        view.addSubview(metricsChart)
        NSLayoutConstraint.activate([
            metricsChart.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 0),
            metricsChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12),
            metricsChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
            metricsChart.heightAnchor.constraint(equalToConstant: 250),
            
            metricsCardView.topAnchor.constraint(equalTo: metricsChart.bottomAnchor, constant: 12),
            metricsCardView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 12),
            metricsCardView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),

        ])
    }
}
