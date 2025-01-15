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
        fetch()
        errorDelegate = self
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    var blockchainName:String = ""
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private func fetch() {
        viewModel.fetchBlockchainDetail(name: blockchainName)
    }
    
    private func setupBindings(){
        viewModel.state
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

extension BlockchainDetailViewController:ErrorStateDelegate{
    func didTapTryAgain() {
        fetch()        
    }
}
