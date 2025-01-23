//
//  TokenDetailViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/8/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class TokenDetailVM: BaseVM<TokenDetailVM.TokenDetailTypes> {

    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchTokenDetail(name:String,contract:String,chain:String){
        stateSubject.send(.loading)
        
        networkService.sendRequest(
            endpoint: TokenEndpoint.getSingleToken(contract: contract, name: name, chain: chain),
            type: TokenDetailDTOModel.self
        ).sink { [weak self] completion in
            guard let self else {return}
            
            switch completion {
            case .finished:
                break
            case .failure(let error):
                stateSubject.send(.error(error))
            }
        } receiveValue: { [weak self] dto in
            guard let self else {return}
            
            guard let uiModel = TokenDetailUIModel(dto: dto),
                  let chartDataModel = TokenDetailChartDataModel(dto: dto)
            else {
                stateSubject.send(.error(.modelTransformFailure))
                return
            }
            
            let combinedModel = TokenCombinedModel(uiModel: uiModel, chartData: chartDataModel)
            stateSubject.send(.loaded(.detail(combinedModel)))
        }
        .store(in: &cancellables)
    }
}

extension TokenDetailVM{
    enum TokenDetailTypes{
        case detail(TokenCombinedModel)
    }
}

