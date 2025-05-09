//
//  MetricsViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class MetricsVC: BaseSidePageVC {

    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    private let vm = MetricsVM()
    
    private lazy var metricsGeneralView = MetricsGeneral()
    private lazy var metricsChart = MetricsChart()
    private lazy var metricsStatistics = MetricsStatistics()
    
    override func fetch(){
        vm.fetchMetrics()
    }
    
    override func setBindings(){
        vm.state
            .sink {[weak self] state in
                guard let self else {return}
                
                switch state {
                case .idle, .loading:
                    hideError()
                    showLoading()
                case .loaded(let data):
                    hideError()
                    hideLoading()
                    switch data {
                    case .metrics(let metrics):
                        metricsChart.updateChart(with: metrics.chartData)
                        metricsStatistics.configure(with: metrics.statisticsData)
                        metricsGeneralView.configure(with: metrics.generalData)
                    }
                case .error(let error):
                    hideLoading()
                    showError(for: error)
                }
            }
            .store(in: &cancellables)
    }
    
    private func setupUI(){
        navigationItem.title = "Metrics"
        view.addSubview(metricsGeneralView)
        view.addSubview(metricsChart)
        view.addSubview(metricsStatistics)
        NSLayoutConstraint.activate([
            metricsChart.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            metricsChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            metricsChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            metricsChart.heightAnchor.constraint(equalToConstant: 250),
            
            metricsGeneralView.topAnchor.constraint(equalTo: metricsChart.bottomAnchor, constant: 12),
            metricsGeneralView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            metricsGeneralView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            metricsStatistics.topAnchor.constraint(equalTo: metricsGeneralView.bottomAnchor, constant: 12),
            metricsStatistics.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            metricsStatistics.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
        ])
    }
}
