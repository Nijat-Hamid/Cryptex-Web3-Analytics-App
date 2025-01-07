//
//  BlockchainDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BlockchainDetailViewController: BaseHidesTabBarViewController {
    
    private let viewModel = BlockchainDetailViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    var blockchainName:String?
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private func setupBindings(){
        guard let blockchainName = blockchainName else {return}
        showLoading()
        
        viewModel.fetchBlockchainDetail(name: blockchainName )
        viewModel.data
            .receive(on: DispatchQueue.main)
            .sink {[weak self] response in
                guard let self else {return}
                blockchainChart.updateChart(with: response.chartData)
                blockchainInfoView.configure(with: response.uiModel)
                
                hideLoading()
                
            }.store(in: &cancellables)
    }
    
    private lazy var blockchainInfoView = BlockchainInfoView()
    private lazy var blockchainChart = BlockchainChartView()
    
    private func setupUI(){
        view.addSubview(blockchainInfoView)
        view.addSubview(blockchainChart)
        NSLayoutConstraint.activate([
            blockchainInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            blockchainInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            blockchainInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            blockchainChart.topAnchor.constraint(equalTo: blockchainInfoView.bottomAnchor, constant: 12),
            blockchainChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            blockchainChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            blockchainChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}
