//
//  BlockchainDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BlockchainDetailViewModel: NSObject {
    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<BlockchainCombinedModel, Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBlockchainDetail(name:String){
        guard !name.isEmpty else {return}
        networkService.sendRequest(
            endpoint: BlockchainEndpoint.getSingleBlockchain(name: name),
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
