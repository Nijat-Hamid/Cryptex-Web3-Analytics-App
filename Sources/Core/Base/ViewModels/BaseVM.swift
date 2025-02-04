//
//  BaseViewModel.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/14/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Combine
import Foundation

enum LoadingState<T> {
    case idle
    case loading
    case loaded(T)
    case error(NetworkError)
}

protocol VMState {
    associatedtype Output
    var stateSubject: CurrentValueSubject<LoadingState<Output>, Never> { get }
    var state: AnyPublisher<LoadingState<Output>, Never> { get }
}

extension VMState {
    var state: AnyPublisher<LoadingState<Output>, Never> {
        stateSubject.eraseToAnyPublisher()
    }
}

class BaseVM<T>: NSObject, VMState {
    typealias Output = T
    
    let stateSubject = CurrentValueSubject<LoadingState<Output>, Never>(.idle)
    var cancellables = Set<AnyCancellable>()
}
