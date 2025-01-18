//
//  MetricsViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/18/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Foundation
import Combine

class MetricsViewModel: BaseViewModel<MetricsCombinedModel> {
    
    private let networkService: Networkable
    
    init(networkService: Networkable = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchMetrics(){
        stateSubject.send(.loading)
        
        AppState.shared.selectedProtocolPublisher
            .filter { !$0.id.isEmpty }
            .removeDuplicates()
            .flatMap { name in
                return self.networkService.sendRequest(
                    endpoint: MetricsEndpoint.getMetrics(name: name.subID),
                    type: MetricsDTOModel.self
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
            } receiveValue: { [weak self] dto in
                guard let self else {return}
                
                guard let generalData = MetricsGeneralModel(dto: dto),
                      let chartData = MetricsChartModel(dto: dto),
                      let statisticsData = MetricsStatisticsModel(dto: dto)
                else {
                    stateSubject.send(.error(.decode))
                    return
                }

                
                let combinedData = MetricsCombinedModel(generalData: generalData, chartData: chartData,statisticsData: statisticsData)
                stateSubject.send(.loaded(combinedData))
            }
            .store(in: &cancellables)
    }
}
