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
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: TokenEndpoint.getTokens(name: name.id),
                    type: TokensDTOModel.self
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
                
                let uiData = data.toUIModels() as [TokensUIModel]
                tokensUIData = uiData
                stateSubject.send(.loaded(.token))
            }
            .store(in: &cancellables)
    }
}

extension TokensVM{
    enum TokenTypes{
        case token
    }
}

