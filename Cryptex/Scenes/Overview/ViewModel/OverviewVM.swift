//
//  OverviewVM.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/27/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class OverviewVM: BaseVM<OverviewVM.OverviewTypes> {
    
    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchProtocol(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.subID.isEmpty }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else {return}
                stateSubject.send(.loading)
            })
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: OverviewEndpoint.getProtocol(name: name.subID),
                    type: OverviewCombinedDTOModel.self
                )
                .catch { [weak self] error -> AnyPublisher<OverviewCombinedDTOModel, Never> in
                    guard let self else {return Empty().eraseToAnyPublisher() }
                    stateSubject.send(.error(error))
                    return Empty().eraseToAnyPublisher()
                }
            }
            .sink (receiveValue: { [weak self] combinedDTO in
                guard let self else {return}
                
                switch combinedDTO {
                case .lendingModel(let lending):
                    guard let statistics = LendingProtocolStatisticsModel(dto: lending),
                          let chart = LendingProtocolChartModel(dto: lending),
                          let detail = LendingProtocolDetailModel(dto: lending)
                    else {
                        stateSubject.send(.error(.modelTransformFailure))
                        return
                    }
                    let combinedData = OverviewLendingUIModel(statistics: statistics,detailData: detail,charData: chart)
                    stateSubject.send(.loaded(.protocols(.lendingUIModel(combinedData))))
                    
                case .dexModel(let dex):
                    guard let statistics = DexProtocolStatisticsModel(dto: dex),
                          let chart = DexProtocolChartModel(dto: dex),
                          let detail = DexProtocolDetailModel(dto: dex)
                    else {
                        stateSubject.send(.error(.modelTransformFailure))
                        return
                    }
                    let combinedData = OverviewDexUIModel(statistics: statistics,detailData: detail,charData: chart)
                    stateSubject.send(.loaded(.protocols(.dexUIModel(combinedData))))
                }
            })
            .store(in: &cancellables)
    }
    
    func getPickerData(for type:SheetType) -> [PickerTypes]? {
        if case .loaded(let data) = stateSubject.value {
            switch type {
            case .chain:
                switch data {
                case .protocols(.lendingUIModel(let lending)):
                    return lending.statistics.selectChains.map { PickerTypes(id: $0.id, label: $0.label, default: $0.default, value: $0.value, img: $0.img)}
                case .protocols(.dexUIModel(let dex)):
                    return dex.statistics.selectChains.map { PickerTypes(id: $0.id, label: $0.label, default: $0.default, value: $0.value, img: $0.img)}
                }
            case .protocolVersion:
                switch data {
                case .protocols(.lendingUIModel(let lending)):
                    return lending.statistics.selectProtocols.map { PickerTypes(id: $0.id, label: $0.label, default: $0.default, value: $0.value, img: $0.img)}
                case .protocols(.dexUIModel(let dex)):
                    return dex.statistics.selectProtocols.map { PickerTypes(id: $0.id, label: $0.label, default: $0.default, value: $0.value, img: $0.img)}
                }
            case .unknown:
                return []
            }
        }
        return []
        
        
    }
}

extension OverviewVM{
    enum OverviewTypes{
        case protocols(OverviewUIModel)
    }
}
