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
    
    var protocolName:String = ""
    var tokenChain:String = ""
    var tokenContract:String = ""
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private func fetch(){
        vm.fetchTokenDetail(name: protocolName, contract: tokenContract, chain: tokenChain)
    }
    
    private func setupBindings(){
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
                    tokensChart.updateChart(with: data.chartData)
                    tokenInfoView.configure(with: data.uiModel)
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

extension TokensDetailVC:ErrorStateDelegate{
    func didTapTryAgain() {
        fetch()
    }
    
    
}
