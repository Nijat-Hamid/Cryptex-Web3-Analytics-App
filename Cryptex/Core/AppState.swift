//
//  AppState.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/2/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//
import Combine
import Foundation
import UIKit

class AppState {
    // Singleton Pattern
    static let shared = AppState()
    // UserDefaults
    private let userDefault = UserDefaults.standard
    // SelectedProtocolID publisher
    private let selectedProtocolID = CurrentValueSubject<String,Never>("")
    // Encapsulation for our publisher
    var protocolIDPublisher: AnyPublisher<String, Never> {
           selectedProtocolID.eraseToAnyPublisher()
       }
    
    private init() {
        if let savedProtocolID = userDefault.string(forKey: "selectedProtocolID") {
                   selectedProtocolID.send(savedProtocolID)
               }
    }
    
    // State Functions
    func setProtocolID (with id:String) {
        selectedProtocolID.send(id)
        userDefault.set(id, forKey: "selectedProtocolID")
    }
    
    func resetProtocolID (){
        userDefault.removeObject(forKey: "selectedProtocolID")
        selectedProtocolID.send("")
    }
    
    func getInitialProtocolID() -> String {
           if let savedProtocolID = userDefault.string(forKey: "selectedProtocolID") {
               return savedProtocolID
           }else {
               return ""
           }
           
       }
}


