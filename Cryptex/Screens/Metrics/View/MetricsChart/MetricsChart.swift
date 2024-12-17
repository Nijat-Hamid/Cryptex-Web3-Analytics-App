//
//  MetricsChart.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/16/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class MetricsChart: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
        
    private lazy var chart = LineChart()
    
    private func setupUI() {
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        self.applyCornerRadiusWithShadow()
        addSubview(chart)
        
        NSLayoutConstraint.activate([
            chart.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            chart.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            chart.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            chart.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8)
        ])
        
        let dataEntries = [
             ChartDataEntry(x: 1, y: 2),
             ChartDataEntry(x: 2, y: 4),
             ChartDataEntry(x: 3, y: 3),
             ChartDataEntry(x: 4, y: 5),
             ChartDataEntry(x: 5, y: 6)
         ]
        
        chart.chartData = dataEntries
        chart.chartDataLabel = "Metrics"
        
    }
    
       
}
