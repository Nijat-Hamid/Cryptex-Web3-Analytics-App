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
        setupChartData()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
        setupChartData()
    }
        
    private lazy var chart:LineChartView = {
        let chart = LineChartView()
        chart.translatesAutoresizingMaskIntoConstraints = false
        chart.backgroundColor = .clear
        chart.rightAxis.enabled = false
        
        chart.xAxis.drawGridLinesEnabled = false
        chart.xAxis.drawAxisLineEnabled = false
        chart.xAxis.labelPosition = .bottom
        chart.xAxis.labelFont = UIFont(name: "Geist-medium", size: 10)!
        chart.xAxis.labelTextColor = .foreground
        
        chart.leftAxis.drawGridLinesEnabled = false
        chart.leftAxis.drawAxisLineEnabled = false
        chart.leftAxis.labelFont = UIFont(name: "Geist-medium", size: 10)!
        chart.leftAxis.labelTextColor = .foreground
        
        chart.drawGridBackgroundEnabled = false
        chart.legend.enabled = false
        
        chart.isUserInteractionEnabled = true
        chart.highlightPerTapEnabled = true
        
        let marker = ChartMarkerView()
        chart.marker = marker
        
        return chart
    }()
    
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
        
    }
    
    private func setupChartData() {
        let dataEntries = [
            ChartDataEntry(x: 1, y: 2),
            ChartDataEntry(x: 2, y: 4),
            ChartDataEntry(x: 3, y: 3),
            ChartDataEntry(x: 4, y: 5),
            ChartDataEntry(x: 5, y: 6)
        ]
        
        let dataSet = LineChartDataSet(entries: dataEntries, label: "Metrics")
        
        dataSet.colors = [.chart]
        dataSet.lineWidth = 2
        dataSet.drawFilledEnabled = true
        dataSet.fillColor = .chart
        dataSet.fillAlpha = 0.3
        dataSet.circleRadius = 4
        dataSet.drawValuesEnabled = false
        dataSet.setCircleColor(.chart)
        
        let data = LineChartData(dataSet: dataSet)
        chart.data = data
    }
}
