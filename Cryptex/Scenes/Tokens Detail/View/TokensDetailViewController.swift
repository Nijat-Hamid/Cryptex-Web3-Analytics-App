//
//  TokensDetailViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class TokensDetailViewController: BaseHidesTabBarViewController {
    
    private let viewModel = TokenDetailViewModel()
    private var cancellables = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()

    }
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    var protocolName:String?
    var tokenChain:String?
    var tokenContract:String?
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private func setupBindings(){
        guard let protocolName = protocolName,
              let tokenChain = tokenChain,
              let tokenContract = tokenContract
        else {return}
        
        showLoading()
        
        viewModel.fetchTokenDetail(name: protocolName, contract: tokenContract, chain: tokenChain)
        viewModel.data
            .receive(on: DispatchQueue.main)
            .sink {[weak self] response in
                guard let self else {return}
                tokensChart.updateChart(with: response.chartData)
                tokenInfoView.configure(with: response.uiModel)
                hideLoading()
                
            }.store(in: &cancellables)
    }
    
    private lazy var tokenInfoView = TokenInfoView()
    private lazy var tokensChart = TokenChartView()
    
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
