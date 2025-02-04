//
//  TokenChartView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class TokenChart: UIView {

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
    
    private var priceData: [ChartDataEntry] = []
    private var marketCapData: [ChartDataEntry] = []
    
    private lazy var chart = LineChart()
    private lazy var segments = CustomSegment(segments: ["Price","Market Cap"])
    
    func updateChart(with data: TokenDetailChartDataModel) {
        
        priceData = data.historicalPrice
        marketCapData = data.historicalMCap
        
        updateChartData(for: 0)
    }
    
    private func updateChartData(for index: Int) {
        
        chart.configureYAxisFormatter(type: .currency)
        chart.chartMarker.yMarkerFormatter = .currency
        
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

extension TokenChart:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index)
    }
    
}
