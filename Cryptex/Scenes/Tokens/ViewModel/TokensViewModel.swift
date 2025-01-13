//
//  TokensViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/7/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class TokensViewModel: NSObject {
    
    private let networkService: Networkable
    private var cancellables = Set<AnyCancellable>()
    
    let data = PassthroughSubject<[TokensUIModel], Never>()
    let error = PassthroughSubject<NetworkError, Never>()
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchTokens(){
        AppState.shared.protocolIDPublisher
            .filter { !$0.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: TokenEndpoint.getTokens(name: name),
                    type: TokensDTOModel.self
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
                let uiData = data.toUIModels() as [TokensUIModel]
                self.data.send(uiData)
            }
            .store(in: &cancellables)
    }
}
