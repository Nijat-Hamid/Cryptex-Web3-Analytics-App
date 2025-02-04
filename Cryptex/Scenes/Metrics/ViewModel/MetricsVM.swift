//
//  MetricsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/18/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class MetricsVM: BaseVM<MetricsVM.MetricsTypes> {
    
    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchMetrics(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self else {return}
                stateSubject.send(.loading)
            })
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: MetricsEndpoint.getMetrics(name: name.subID),
                    type: MetricsDTOModel.self
                )
                .catch { [weak self] error -> AnyPublisher<MetricsDTOModel, Never> in
                    guard let self else {return Empty().eraseToAnyPublisher() }
                    stateSubject.send(.error(error))
                    return Empty().eraseToAnyPublisher()
                }
            }
            .sink ( receiveValue: { [weak self] dto in
                guard let self else {return}
                
                guard let generalData = MetricsGeneralModel(dto: dto),
                      let chartData = MetricsChartModel(dto: dto),
                      let statisticsData = MetricsStatisticsModel(dto: dto)
                else {
                    stateSubject.send(.error(.modelTransformFailure))
                    return
                }

                let combinedData = MetricsCombinedModel(generalData: generalData, chartData: chartData,statisticsData: statisticsData)
                stateSubject.send(.loaded(.metrics(combinedData)))
            })
            .store(in: &cancellables)
    }
}

extension MetricsVM{
    enum MetricsTypes{
        case metrics(MetricsCombinedModel)
    }
}
