//
//  FadeTransition.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/5/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class FadeTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard
            let _ = transitionContext.viewController(forKey: .from)?.view,
            let toView = transitionContext.viewController(forKey: .to)?.view
        else {
            transitionContext.completeTransition(false)
            return
        }
        
        let containerView = transitionContext.containerView
        
        containerView.addSubview(toView)
        let animation = CATransition()
        animation.type = .fade
        animation.duration = transitionDuration(using: transitionContext) - 0.1
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        containerView.layer.add(animation, forKey: "fadeAnimation")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + transitionDuration(using: transitionContext)) {
            transitionContext.completeTransition(true)
        }
    }
}



