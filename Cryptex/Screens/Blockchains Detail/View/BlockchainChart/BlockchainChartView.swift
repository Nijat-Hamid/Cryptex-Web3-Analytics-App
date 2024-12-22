//
//  BlockchainChart.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts

class BlockchainChartView: UIView {
    
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
    private lazy var segments = CustomSegmentView(segments: ["TVL","Market Cap","Cap/TVL"])
    

    private let tvlData: [ChartDataEntry] = [
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
    
    private let capTvlData: [ChartDataEntry] = [
           ChartDataEntry(x: 1, y: 5),
           ChartDataEntry(x: 2, y: 9),
           ChartDataEntry(x: 3, y: 18),
           ChartDataEntry(x: 4, y: 29),
           ChartDataEntry(x: 5, y: 20)
       ]
    
    private func updateChartData(for index: Int) {
        switch index {
        case 0:
            chart.chartData = tvlData
            chart.chartDataLabel = "TVL"
        case 1:
            chart.chartData = marketCapData
            chart.chartDataLabel = "Market Cap"
        case 2:
            chart.chartData = capTvlData
            chart.chartDataLabel = "Cap/TVL"
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

extension BlockchainChartView:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index)
    }
    
}
