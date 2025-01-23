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
    
    private var poolsUIData: PoolsCombinedUIModel? = nil
    
    var poolsData: PoolsCombinedUIModel {
        return poolsUIData ?? .dexUIModel(.init())
    }
    
    func fetchPools(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: PoolEndpoint.getPools(name: name.id),
                    type: PoolsCombinedDTOModel.self
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
            } receiveValue: { [weak self] combinedDTO in
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
            }
            .store(in: &cancellables)
    }
}

extension PoolsVM{
    enum PoolsTypes{
        case pools
    }
}
