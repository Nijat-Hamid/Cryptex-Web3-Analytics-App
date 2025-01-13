//
//  PoolsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/9/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class PoolsViewModel: NSObject {

    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<PoolsCombinedUIModel, Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPools(){
        AppState.shared.protocolIDPublisher
            .filter { !$0.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: PoolEndpoint.getPools(name: name),
                    type: PoolsCombinedDTOModel.self
                )
            }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error)
                    self.error.send(error)
                }
            } receiveValue: { combinedDTO in
                switch combinedDTO {
                case .lendingModel(let lending):
                    let uiModels = lending.toUIModels() as [PoolsLendingUIModel]
                    self.data.send(.lendingUIModel(uiModels))
                    
                case .dexModel(let dex):
                    let uiModels = dex.toUIModels() as [PoolsDexUIModel]
                    self.data.send(.dexUIModel(uiModels))
                }
            }
            .store(in: &cancellables)
    }
}
