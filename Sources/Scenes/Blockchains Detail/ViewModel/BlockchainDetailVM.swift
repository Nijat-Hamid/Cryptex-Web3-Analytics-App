//
//  BlockchainDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class BlockchainDetailVM: BaseVM<BlockchainDetailVM.BlockchainDetailTypes> {
    
    private let networkService: Networkable
   
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBlockchainDetail(name:String){
        stateSubject.send(.loading)
        networkService.sendRequest(
            endpoint: BlockchainEndpoint.getSingleBlockchain(name: name),
            type: BlockchainDetailDTOModel.self
        )
        .catch { [weak self] error -> AnyPublisher<BlockchainDetailDTOModel, Never> in
            guard let self else {return Empty().eraseToAnyPublisher() }
            stateSubject.send(.error(error))
            return Empty().eraseToAnyPublisher()
        }
        .sink ( receiveValue: {[weak self] dto in
            guard let self else {return}
            
            guard let uiModel = BlockchainDetailUIModel(dto: dto),
                  let chartDataModel = BlockchainDetailChartDataModel(dto: dto)
            else {
                stateSubject.send(.error(.modelTransformFailure))
                return
            }
            
            let combinedModel = BlockchainCombinedModel(uiModel: uiModel, chartData: chartDataModel)
            stateSubject.send(.loaded(.detail(combinedModel)))
        })
        .store(in: &cancellables)
    }
}

extension BlockchainDetailVM{
    enum BlockchainDetailTypes{
        case detail(BlockchainCombinedModel)
    }
}
