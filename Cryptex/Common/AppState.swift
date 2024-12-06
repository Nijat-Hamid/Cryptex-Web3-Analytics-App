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
    // Weak Connection
    private weak var navigationController: UINavigationController?
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
           }
           return ""
       }
    
    // Navigation Coordinator Functions
    
    func setRootNavigationController(_ navController: UINavigationController) {
            navigationController = navController
        }
    
    func navigateToPage(page:PageName) {
        DispatchQueue.main.async { [weak self] in
            guard let self, let navigationController = navigationController else {
                       print("Navigation Controller is not set")
                       return
             }
            
            var viewControllers = navigationController.viewControllers
            switch page {
            case .overview:
                let vc = OverviewViewController()
                viewControllers = viewControllers.filter { !($0 is OverviewViewController) }
                viewControllers.append(vc)
                navigationController.setViewControllers(viewControllers, animated: true)
            case .pools:
                let vc = PoolsViewController()
                viewControllers = viewControllers.filter { !($0 is PoolsViewController) }
                viewControllers.append(vc)
                navigationController.setViewControllers(viewControllers, animated: true)
            case .tokens:
                let vc = TokensViewController()
                viewControllers = viewControllers.filter { !($0 is TokensViewController) }
                viewControllers.append(vc)
                navigationController.setViewControllers(viewControllers, animated: true)
            case .blockchains:
                let vc = BlockchainsViewController()
                viewControllers = viewControllers.filter { !($0 is BlockchainsViewController) }
                viewControllers.append(vc)
                navigationController.setViewControllers(viewControllers, animated: true)
            case .root:
                let vc = RootViewController()
                viewControllers = viewControllers.filter { !($0 is RootViewController) }
                viewControllers.append(vc)
                navigationController.setViewControllers(viewControllers, animated: true)
            }
        }
        
    }
}

enum PageName:String{
    case root = "Root"
    case overview = "Overview"
    case pools = "Pools"
    case tokens = "Tokens"
    case blockchains = "Blockchains"
}
