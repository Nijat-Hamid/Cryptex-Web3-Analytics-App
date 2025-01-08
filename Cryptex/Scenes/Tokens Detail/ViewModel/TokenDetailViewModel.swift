//
//  TokenDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/8/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class TokenDetailViewModel: NSObject {

    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<BlockchainCombinedModel, Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchTokenDetail(name:String,contract:String,chain:String){
        guard !name.isEmpty,!contract.isEmpty,!chain.isEmpty else {return}
        networkService.sendRequest(
            endpoint: TokenEndpoint.getSingleToken(contract: contract, name: name, chain: chain),
            type: BlockchainDetailDTOModel.self
        ).sink { completion in
            switch completion {
            case .finished:
                break
            case .failure(let error):
                self.error.send(error)
            }
        } receiveValue: { dto in
            guard let uiModel = BlockchainDetailUIModel(dto: dto),
                  let chartDataModel = BlockchainChartDataModel(dto: dto) else {
                self.error.send(.decode)
                return
            }
            
            let combinedModel = BlockchainCombinedModel(uiModel: uiModel, chartData: chartDataModel)
            self.data.send(combinedModel)
        }.store(in: &cancellables)
    }
}
