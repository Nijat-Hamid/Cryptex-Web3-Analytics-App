//
//  BlockchainDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class BlockchainDetailViewModel: BaseViewModel<BlockchainCombinedModel> {
    private let networkService: Networkable
   
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBlockchainDetail(name:String){
        stateSubject.send(.loading)
        networkService.sendRequest(
            endpoint: BlockchainEndpoint.getSingleBlockchain(name: name),
            type: BlockchainDetailDTOModel.self
        ).sink {[weak self] completion in
            guard let self else {return}
            
            switch completion {
            case .finished:
                break
            case .failure(let error):
                stateSubject.send(.error(error))
            }
        } receiveValue: {[weak self] dto in
            guard let self else {return}
            
            guard let uiModel = BlockchainDetailUIModel(dto: dto),
                  let chartDataModel = BlockchainDetailChartDataModel(dto: dto)
            else {
                stateSubject.send(.error(.decode))
                return
            }
            
            let combinedModel = BlockchainCombinedModel(uiModel: uiModel, chartData: chartDataModel)
            stateSubject.send(.loaded(combinedModel))
        }.store(in: &cancellables)
    }
}
