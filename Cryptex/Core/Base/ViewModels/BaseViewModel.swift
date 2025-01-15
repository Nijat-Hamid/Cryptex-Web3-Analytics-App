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

protocol ViewModelState {
    associatedtype Output
    var stateSubject: CurrentValueSubject<LoadingState<Output>, Never> { get }
    var state: AnyPublisher<LoadingState<Output>, Never> { get }
}

extension ViewModelState {
    var state: AnyPublisher<LoadingState<Output>, Never> {
        stateSubject.eraseToAnyPublisher()
    }
}

class BaseViewModel<T>: NSObject, ViewModelState {
    typealias Output = T
    
    let stateSubject = CurrentValueSubject<LoadingState<Output>, Never>(.idle)
    var cancellables = Set<AnyCancellable>()
}
