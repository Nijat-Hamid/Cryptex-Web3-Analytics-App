//
//  PoolDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/11/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class PoolDetailVM: BaseVM<PoolDetailVM.PoolDetailTypes> {

    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchPoolDetail(name:String,contract:String,chain:String){
        stateSubject.send(.loading)
        
        networkService.sendRequest(
            endpoint: PoolEndpoint.getSinglePool(contract: contract, name: name, chain: chain),
            type: PoolsDetailCombinedDTOModel.self
        )
        .catch { [weak self] error -> AnyPublisher<PoolsDetailCombinedDTOModel, Never> in
            guard let self else {return Empty().eraseToAnyPublisher() }
            stateSubject.send(.error(error))
            return Empty().eraseToAnyPublisher()
        }
        .sink ( receiveValue: { [weak self] combinedDto in
            guard let self else {return}
            
            switch combinedDto {
            case .detailLendingModel(let lending):
                guard let uiData = DetailLendingUIModel(dto: lending),
                      let chartData = DetailChartModel(dto: .detailLendingModel(lending))
                else {
                    stateSubject.send(.error(.modelTransformFailure))
                    return
                }
                
                let combinedModel = DetailLendingCombinedModel(uiData: uiData, chartData: chartData)
                stateSubject.send(.loaded(.pooldetail(.detailLendingModel(combinedModel))))
            case .detailDexModel(let dex):
                guard let uiData = DetailDexUIModel(dto: dex),
                      let chartData = DetailChartModel(dto: .detailDexModel(dex))
                else {
                    stateSubject.send(.error(.modelTransformFailure))
                    return
                }
                
                let combinedModel = DetailDexCombinedModel(uiData: uiData, chartData: chartData)
                stateSubject.send(.loaded(.pooldetail(.detailDexModel(combinedModel))))
            }
        })
        .store(in: &cancellables)
    }
}

extension PoolDetailVM{
    enum PoolDetailTypes{
        case pooldetail(PoolsDetailCombinedUIModel)
    }
}
