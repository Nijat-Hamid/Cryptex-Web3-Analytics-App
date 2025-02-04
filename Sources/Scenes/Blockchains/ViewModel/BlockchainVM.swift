//
//  BlockchainViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class BlockchainVM: BaseVM<BlockchainVM.BlockchainTypes> {
    
    private let networkService: Networkable
   
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    private var blockchainsUIData:[BlockchainsUIModel] = []
    
    var blockchainData:[BlockchainsUIModel]{
        return blockchainsUIData
    }
    
    func fetchBlockchain(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else {return}
                stateSubject.send(.loading)
            })
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: BlockchainEndpoint.getBlockchains(name: name.id),
                    type: BlockchainsDTOModel.self
                )
                .catch { [weak self] error -> AnyPublisher<BlockchainsDTOModel, Never> in
                    guard let self else {return Empty().eraseToAnyPublisher() }
                    stateSubject.send(.error(error))
                    return Empty().eraseToAnyPublisher()
                }
            }
            .sink ( receiveValue: { [weak self] data in
                guard let self else {return}
                
                let uiData = data.toUIModels() as [BlockchainsUIModel]
                blockchainsUIData = uiData
                stateSubject.send(.loaded(.blockchains))
            })
            .store(in: &cancellables)
    }
}

extension BlockchainVM{
    enum BlockchainTypes{
        case blockchains
    }
}
