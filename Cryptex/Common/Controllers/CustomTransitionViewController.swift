//
//  BaseTransitionViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class CustomTransitionViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
    }
}

extension CustomTransitionViewController:UINavigationControllerDelegate{
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        return FadeTransition()
    }
}
