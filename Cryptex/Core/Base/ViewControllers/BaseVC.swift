//
//  BaseViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/30/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBindings()
        fetch()
    }
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .background
    }
    
    var cancellables = Set<AnyCancellable>()
    
    func fetch() { }
    
    func setBindings() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.delegate = self
    }
}
extension BaseVC:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return FadeTransition()
    }
}
