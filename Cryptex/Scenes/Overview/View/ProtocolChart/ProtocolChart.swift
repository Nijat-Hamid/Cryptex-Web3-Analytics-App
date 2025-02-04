//
//  ProtocolChart.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/24/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import DGCharts
import Combine

class ProtocolChart: UIView {
    
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
    
    weak var delegate:SegmentDelegate?{
        set {
            segments.delegate = newValue
        }
        get {
            segments.delegate
        }
    }
    
    
    private var cancellables = Set<AnyCancellable>()
    private var currentChain: ProtocolChains.RawValue = ""
    
    private var chartOne: [String:[ChartDataEntry]] = [:]
    private var chartTwo: [String:[ChartDataEntry]] = [:]
    private var chartThree: [String:[ChartDataEntry]] = [:]
    
    private lazy var chart = LineChart()
    lazy var segments = CustomSegment()
        
    private func chainSubscription (){
        AppState.shared.selectedChain
            .receive(on: DispatchQueue.main)
            .sink { [weak self] chain in
                guard let self else {return}
                currentChain = chain
                updateChartData(for: 0,chain: chain)
                segments.updateSegments()
            }
            .store(in: &cancellables)
    }
    
    func updateChart(with data: OverviewChartModel) {
        switch data {
        case .lendingModel(let lending):
            segments.segments = ["TVL","Supply","Borrow"]
            chartOne = lending.historicalchainTvls
            chartTwo = lending.historicalDepositedAmountChain
            chartThree = lending.historicalTotalBorrowedChains
            
        case .dexModel(let dex):
            segments.segments = ["TVL","Volume","Fee"]
            chartOne = dex.historicalchainTvls
            chartTwo = dex.historicalVolumeChains
            chartThree = dex.historicalFeeChains
            
        }
        
        updateChartData(for: 0,chain: currentChain)
    }
    
   
    private func updateChartData(for index: Int, chain:ProtocolChains.RawValue) {
        chart.configureYAxisFormatter(type: .currency)
        chart.chartMarker.yMarkerFormatter = .currency
        
        
        let chartData: [ChartDataEntry]
        switch index {
        case 0:
            chartData = chartOne[currentChain] ?? []
        case 1:
            chartData = chartTwo[currentChain] ?? []
        case 2:
            chartData = chartThree[currentChain] ?? []
        default:
            chartData = []
        }
        
        chart.chartData = chartData
    }
    
    
    private func setupUI() {
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(segments)
        addSubview(chart)
        chainSubscription()
        segments.delegate = self
        
        NSLayoutConstraint.activate([
            segments.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            segments.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            
            chart.topAnchor.constraint(equalTo: segments.bottomAnchor,constant: 10),
            chart.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 8),
            chart.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -8),
            chart.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -8),
            
            heightAnchor.constraint(equalToConstant: 290)
        ])
    }
}

extension ProtocolChart:SegmentDelegate{
    func didSelect(index: Int) {
        updateChartData(for: index,chain: currentChain)
    }
}
