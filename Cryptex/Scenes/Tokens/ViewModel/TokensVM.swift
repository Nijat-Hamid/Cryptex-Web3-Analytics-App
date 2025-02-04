//
//  TokensViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/7/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class TokensVM: BaseVM<TokensVM.TokenTypes> {
    
    private let networkService: Networkable
  
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    private var tokensUIData:[TokensUIModel] = []
    
    var tokenData:[TokensUIModel]{
        return tokensUIData
    }
    
    func fetchTokens(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else {return}
                stateSubject.send(.loading)
            })
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: TokenEndpoint.getTokens(name: name.id),
                    type: TokensDTOModel.self
                )
                .catch { [weak self] error -> AnyPublisher<TokensDTOModel, Never> in
                    guard let self else {return Empty().eraseToAnyPublisher() }
                    stateSubject.send(.error(error))
                    return Empty().eraseToAnyPublisher()
                }
            }
            .sink (receiveValue: { [weak self] data in
                guard let self else {return}
                
                let uiData = data.toUIModels() as [TokensUIModel]
                tokensUIData = uiData
                stateSubject.send(.loaded(.token))
            })
            .store(in: &cancellables)
    }
}

extension TokensVM{
    enum TokenTypes{
        case token
    }
}

