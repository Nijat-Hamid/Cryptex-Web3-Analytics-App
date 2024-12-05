//
//  FadeTransition.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class FadeTransition: NSObject, UIViewControllerAnimatedTransitioning {
    private let operation: UINavigationController.Operation
    
    init(operation: UINavigationController.Operation) {
        self.operation = operation
        super.init()
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let fromView = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view
        else { return }
        
        let containerView = transitionContext.containerView
        
        if operation == .push {
            containerView.addSubview(toView)
            
            UIView.transition(from: fromView, to: toView, duration: transitionDuration(using: transitionContext), options: .transitionCrossDissolve) { _ in
                transitionContext.completeTransition(true)
            }
            

        } else if operation == .pop {
            containerView.insertSubview(toView, belowSubview: fromView)
            
            UIView.transition(from: fromView, to: toView, duration: transitionDuration(using: transitionContext), options: .transitionCrossDissolve) { _ in
                transitionContext.completeTransition(true)
            }
            
        }
    }
}


