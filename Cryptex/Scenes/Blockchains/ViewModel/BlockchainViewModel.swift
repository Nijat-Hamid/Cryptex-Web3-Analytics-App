//
//  BlockchainViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/26/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class BlockchainViewModel: NSObject {
    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<[BlockchainsUIModel], Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchBlockchain(){
        AppState.shared.protocolIDPublisher
            .filter { !$0.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: BlockchainEndpoint.getBlockchains(name: name),
                    type: BlockchainsDTOModel.self
                )
            }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error.send(error)
                }
            } receiveValue: { data in
                let uiData = data.toUIModels() as [BlockchainsUIModel]
                self.data.send(uiData)
            }
            .store(in: &cancellables)
    }
    
}
