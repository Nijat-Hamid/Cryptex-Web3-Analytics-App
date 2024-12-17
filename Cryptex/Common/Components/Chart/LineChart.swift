//
//  LineChartView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/16/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class LineChart: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    var chartData:[ChartDataEntry] = [] {
        didSet{
            setupChart()
        }
    }
    
    var chartDataLabel:String = "" {
        didSet{
            setupChart()
        }
    }
    
    private lazy var chartMarker = ChartMarkerView()
    
    
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
        
        chart.marker = chartMarker
        
        return chart
    }()
    
    private func setupChart(){
        guard !chartData.isEmpty, !chartDataLabel.isEmpty else {
            chart.data = nil
            return
        }
        let dataSet = LineChartDataSet(entries: chartData, label: chartDataLabel)
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
    
    private func setupUI(){
        addSubview(chart)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chart.topAnchor.constraint(equalTo: topAnchor),
            chart.leadingAnchor.constraint(equalTo: leadingAnchor),
            chart.trailingAnchor.constraint(equalTo: trailingAnchor),
            chart.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
