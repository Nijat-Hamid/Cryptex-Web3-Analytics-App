//
//  PoolsDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/25/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class PoolsDetailVC: BaseHidesTabBarVC {

    private let vm = PoolDetailVM()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func loadView() {
        super.loadView()
        setupUI()
    }
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    var protocolName:String = ""
    var poolChain:String = ""
    var poolContract:String = ""
    
    override func fetch(){
        vm.fetchPoolDetail(name: protocolName, contract: poolContract, chain: poolChain)
    }
    
    override func setBindings(){
        vm.state
            .receive(on: DispatchQueue.main)
            .sink {[weak self] state in
                guard let self else {return}
                
                switch state {
                case .idle: break
                case .loading:
                    hideError()
                    showLoading()
                case .loaded(let data):
                    hideError()
                    hideLoading()
                    
                    switch data {
                    case .detailLendingModel(let lending):
                        poolsChart.updateChart(with: lending.chartData)
                        poolInfoView.configure(with: .lending(lending.uiData))
                    case .detailDexModel(let dex):
                        poolsChart.updateChart(with: dex.chartData)
                        poolInfoView.configure(with: .dex(dex.uiData))
                    }
                case .error(let error):
                    hideLoading()
                    showError(for: error)
                }
            }
            .store(in: &cancellables)
    }
    
    
    private lazy var poolInfoView = PoolInfo()
    private lazy var poolsChart = PoolChart()
    
    private func setupUI(){
        view.addSubview(poolInfoView)
        view.addSubview(poolsChart)
        NSLayoutConstraint.activate([
            poolInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            poolInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            poolInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            poolsChart.topAnchor.constraint(equalTo: poolInfoView.bottomAnchor, constant: 12),
            poolsChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            poolsChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            poolsChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
    
}
