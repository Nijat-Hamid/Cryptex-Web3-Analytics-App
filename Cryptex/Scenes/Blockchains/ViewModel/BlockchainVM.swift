//
//  BlockchainViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class BlockchainVM: BaseVM<[BlockchainsUIModel]> {
    
    private let networkService: Networkable
   
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBlockchain(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: BlockchainEndpoint.getBlockchains(name: name.id),
                    type: BlockchainsDTOModel.self
                )
            }
            .sink { [weak self] completion in
                guard let self else {return}
                
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    stateSubject.send(.error(error))
                }
            } receiveValue: { [weak self] data in
                guard let self else {return}
                
                let uiData = data.toUIModels() as [BlockchainsUIModel]
                stateSubject.send(.loaded(uiData))
            }
            .store(in: &cancellables)
    }
    
}
