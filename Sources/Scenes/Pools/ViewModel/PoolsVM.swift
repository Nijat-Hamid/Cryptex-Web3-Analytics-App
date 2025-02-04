//
//  PoolsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/9/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class PoolsVM: BaseVM<PoolsVM.PoolsTypes> {

    private let networkService: Networkable
 
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    private var poolsUIData: PoolsCombinedUIModel = .dexUIModel(.init())
    
    var poolsData: PoolsCombinedUIModel {
        return poolsUIData
    }
    
    func fetchPools(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else {return}
                stateSubject.send(.loading)
            })
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: PoolEndpoint.getPools(name: name.id),
                    type: PoolsCombinedDTOModel.self
                )
                .catch { [weak self] error -> AnyPublisher<PoolsCombinedDTOModel, Never> in
                    guard let self else {return Empty().eraseToAnyPublisher() }
                    stateSubject.send(.error(error))
                    return Empty().eraseToAnyPublisher()
                }
            }
            .sink ( receiveValue: { [weak self] combinedDTO in
                guard let self else {return}
            
                switch combinedDTO {
                case .lendingModel(let lending):
                    let uiModels = lending.toUIModels() as [PoolsLendingUIModel]
                    poolsUIData = .lendingUIModel(uiModels)
                    stateSubject.send(.loaded(.pools))
                    
                case .dexModel(let dex):
                    let uiModels = dex.toUIModels() as [PoolsDexUIModel]
                    poolsUIData = .dexUIModel(uiModels)
                    stateSubject.send(.loaded(.pools))
                }
            })
            .store(in: &cancellables)
    }
}

extension PoolsVM{
    enum PoolsTypes{
        case pools
    }
}
