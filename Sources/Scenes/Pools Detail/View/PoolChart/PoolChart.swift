//
//  TokenChartView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class PoolChart: UIView {

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
    
    private var tvlData: [ChartDataEntry] = []
    private var apyData: [ChartDataEntry] = []
    
    private lazy var chart = LineChart()
    private lazy var segments = CustomSegment(segments: ["TVL","APY"])
    
    func updateChart(with data: DetailChartModel) {
        
        tvlData = data.historicalTvl
        apyData = data.historicalApy
        
        updateChartData(for: 0)
    }

    private func updateChartData(for index: Int) {
        switch index {
        case 0:
            chart.chartData = tvlData
            chart.chartDataLabel = "TVL"
            chart.configureYAxisFormatter(type: .currency)
            chart.chartMarker.yMarkerFormatter = .currency
        case 1:
            chart.chartData = apyData
            chart.chartDataLabel = "APY"
            chart.configureYAxisFormatter(type: .percentage)
            chart.chartMarker.yMarkerFormatter = .percentage
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

extension PoolChart:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index)
    }
    
}
