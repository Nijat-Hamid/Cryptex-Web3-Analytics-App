//
//  TokenChartView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class TokenChartView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadiusWithShadow()
    }
    
    private lazy var chart = LineChart()
    private lazy var segments = CustomSegmentView(segments: ["Price","Market Cap"])
    

    private let priceData: [ChartDataEntry] = [
           ChartDataEntry(x: 1, y: 2),
           ChartDataEntry(x: 2, y: 4),
           ChartDataEntry(x: 3, y: 3),
           ChartDataEntry(x: 4, y: 5),
           ChartDataEntry(x: 5, y: 6)
       ]
       
       private let marketCapData: [ChartDataEntry] = [
           ChartDataEntry(x: 1, y: 20),
           ChartDataEntry(x: 2, y: 25),
           ChartDataEntry(x: 3, y: 23),
           ChartDataEntry(x: 4, y: 30),
           ChartDataEntry(x: 5, y: 28)
       ]
    
    private func updateChartData(for index: Int) {
        switch index {
        case 0:
            chart.chartData = priceData
            chart.chartDataLabel = "Price"
        case 1:
            chart.chartData = marketCapData
            chart.chartDataLabel = "Market Cap"
        default:
            break
        }
    }
    
    private func setupUI() {
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(segments)
        addSubview(chart)
        
        segments.delegate = self
        
        NSLayoutConstraint.activate([
            segments.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            segments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            chart.topAnchor.constraint(equalTo: segments.bottomAnchor,constant: 10),
            chart.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            chart.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            chart.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8)
        ])
        
        
    }
}

extension TokenChartView:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index)
    }
    
}
