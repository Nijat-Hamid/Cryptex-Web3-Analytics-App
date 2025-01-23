//
//  TokensDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class TokensDetailVC: BaseHidesTabBarVC {
    
    private let vm = TokenDetailVM()

    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    var protocolName:String = ""
    var tokenChain:String = ""
    var tokenContract:String = ""
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    override func fetch(){
        vm.fetchTokenDetail(name: protocolName, contract: tokenContract, chain: tokenChain)
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
                    case .detail(let detail):
                        tokensChart.updateChart(with: detail.chartData)
                        tokenInfoView.configure(with: detail.uiModel)
                    }
                case .error(let error):
                    hideLoading()
                    showError(for: error)
                }
            }
            .store(in: &cancellables)
    }
    
    private lazy var tokenInfoView = TokenInfo()
    private lazy var tokensChart = TokenChart()
    
    private func setupUI(){
        view.addSubview(tokenInfoView)
        view.addSubview(tokensChart)
        NSLayoutConstraint.activate([
            tokenInfoView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            tokenInfoView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            tokenInfoView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            
            tokensChart.topAnchor.constraint(equalTo: tokenInfoView.bottomAnchor, constant: 12),
            tokensChart.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 14),
            tokensChart.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -14),
            tokensChart.heightAnchor.constraint(equalToConstant: 280)
        ])
    }

}
