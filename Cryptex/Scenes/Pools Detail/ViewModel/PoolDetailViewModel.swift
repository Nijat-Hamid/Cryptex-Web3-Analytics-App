//
//  PoolDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/11/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class PoolDetailViewModel: BaseViewModel<PoolsDetailCombinedUIModel> {

    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPoolDetail(name:String,contract:String,chain:String){
        stateSubject.send(.loading)
        
        networkService.sendRequest(
            endpoint: PoolEndpoint.getSinglePool(contract: contract, name: name, chain: chain),
            type: PoolsDetailCombinedDTOModel.self
        ).sink { [weak self] completion in
            guard let self else {return}
            
            switch completion {
            case .finished:
                break
            case .failure(let error):
                stateSubject.send(.error(error))
            }
        } receiveValue: { [weak self] combinedDto in
            guard let self else {return}
            
            switch combinedDto {
            case .detailLendingModel(let lending):
                guard let uiData = DetailLendingUIModel(dto: lending),
                      let chartData = DetailChartModel(dto: .detailLendingModel(lending))
                else {
                    stateSubject.send(.error(.decode))
                    return
                }
                
                let combinedModel = DetailLendingCombinedModel(uiData: uiData, chartData: chartData)
                stateSubject.send(.loaded(.detailLendingModel(combinedModel)))
            case .detailDexModel(let dex):
                guard let uiData = DetailDexUIModel(dto: dex),
                      let chartData = DetailChartModel(dto: .detailDexModel(dex))
                else {
                    stateSubject.send(.error(.decode))
                    return
                }
                
                let combinedModel = DetailDexCombinedModel(uiData: uiData, chartData: chartData)
                stateSubject.send(.loaded(.detailDexModel(combinedModel)))
            }
        }
        .store(in: &cancellables)
    }
}
