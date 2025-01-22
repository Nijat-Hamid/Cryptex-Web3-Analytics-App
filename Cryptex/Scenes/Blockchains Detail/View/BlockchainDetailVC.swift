//
//  BlockchainDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BlockchainDetailVC: BaseHidesTabBarVC {
    
    private let vm = BlockchainDetailVM()
    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    var blockchainName:String = ""
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    override func fetch() {
        vm.fetchBlockchainDetail(name: blockchainName)
    }
    
    override func setBindings(){
        vm.state
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self else {return}
                
                switch state {
                case .idle: break
                case .loading:
                    hideError()
                    showLoading()
                case .loaded(let data):
                    hideError()
                    hideLoading()
                    blockchainChart.updateChart(with:data.chartData)
                    blockchainInfoView.configure(with: data.uiModel)
                case .error(let error):
                    hideLoading()
                    showError(for: error)
                }
            }
            .store(in: &cancellables)
    }
    
    private lazy var blockchainInfoView = BlockchainInfo()
    private lazy var blockchainChart = BlockchainChart()
    
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
