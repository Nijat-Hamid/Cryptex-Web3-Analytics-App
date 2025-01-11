//
//  PoolDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/11/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class PoolDetailViewModel: NSObject {

    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<TokenCombinedModel, Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPoolDetail(name:String,contract:String,chain:String){
        guard !name.isEmpty,!contract.isEmpty,!chain.isEmpty else {return}
        networkService.sendRequest(
            endpoint: PoolEndpoint.getSinglePool(contract: contract, name: name, chain: chain),
            type: TokenDetailDTOModel.self
        ).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error.send(error)
            }
        } receiveValue: { dto in
            guard let uiModel = TokenDetailUIModel(dto: dto),
                  let chartDataModel = TokenDetailChartDataModel(dto: dto) else {
                self.error.send(.decode)
                return
            }
            
            let combinedModel = TokenCombinedModel(uiModel: uiModel, chartData: chartDataModel)
            self.data.send(combinedModel)
        }.store(in: &cancellables)
    }
}
