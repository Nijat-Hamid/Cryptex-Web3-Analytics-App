//
//  BlockchainChart.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class BlockchainChart: UIView {
    
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
    private var marketCapData: [ChartDataEntry] = []
    private var capTvlData: [ChartDataEntry] = []
    
    private lazy var chart = LineChart()
    private lazy var segments = CustomSegment(segments: ["TVL","Market Cap","Cap/TVL"])
    
    
    func updateChart(with data: BlockchainDetailChartDataModel) {

        tvlData = data.historicalTvl
        marketCapData = data.historicalMcap
        capTvlData = data.historicalMcapTvl
        
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
            chart.chartData = marketCapData
            chart.chartDataLabel = "Market Cap"
            chart.configureYAxisFormatter(type: .currency)
            chart.chartMarker.yMarkerFormatter = .currency
        case 2:
            chart.chartData = capTvlData
            chart.chartDataLabel = "Cap/TVL"
            chart.configureYAxisFormatter(type: .decimal)
            chart.chartMarker.yMarkerFormatter = .decimal
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
            
            chart.topAnchor.constraint(equalTo: segments.bottomAnchor,constant: 8),
            chart.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 4),
            chart.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -4),
            chart.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8)
        ])
        
        
    }

}

extension BlockchainChart:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index)
    }
    
}
