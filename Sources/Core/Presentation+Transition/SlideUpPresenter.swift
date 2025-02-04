//
//  SlideUpPresenter.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/3/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class SlideUpPresenter: UIPresentationController {
    
    private lazy var screenSize: CGRect = {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first
        else { return .zero }
        return window.bounds
    }()
    
    private lazy var dimmingView: UIView = {
        let view = UIView(frame: containerView?.bounds ?? .zero)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        view.alpha = 0
        return view
    }()
    
    private var isDismissing = false
    private var transitionDuration:CGFloat = 0
    private let minimumHeight: CGFloat = 324
    
    private var presentedViewHeight: CGFloat {
        let preferredHeight = screenSize.height * 0.35
        return max(preferredHeight, minimumHeight)
    }
    
     init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?, duration:CGFloat = 0.4) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        self.transitionDuration = duration
    }
    
    override var frameOfPresentedViewInContainerView: CGRect {
        let yPosition = screenSize.height - presentedViewHeight
        return .init(x: 0, y: yPosition, width: screenSize.width, height: presentedViewHeight)
    }
    
    private var initialFrameForPresentedView: CGRect {
        return CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: presentedViewHeight)
    }
    
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        guard let containerView, let presentedView else { return }
        
        containerView.addSubview(dimmingView)
        dimmingView.frame = containerView.bounds
        
        containerView.addSubview(presentedView)
        presentedView.frame = initialFrameForPresentedView
        presentedView.layer.cornerRadius = 10
        presentedView.clipsToBounds = true
        
        // Animate dimming view
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                guard let self else {return}
                dimmingView.alpha = 1
            })
        } else {
            dimmingView.alpha = 1
        }
        
        UIView.animate(withDuration: transitionDuration) { [weak self] in
            guard let self else { return }
            presentedView.frame = self.frameOfPresentedViewInContainerView
        }
    }
    
    func dismissMenu() {
        guard let presentedView else { return }
        guard !isDismissing else { return }
        
        isDismissing = true
        
        if let coordinator = presentedViewController.transitionCoordinator {
            coordinator.animate(alongsideTransition: { [weak self] _ in
                guard let self else {return}
               dimmingView.alpha = 0
            }, completion: { [weak self] _ in
                guard let self else {return}
                dimmingView.removeFromSuperview()
            })
        } else {
            dimmingView.alpha = 0
            dimmingView.removeFromSuperview()
        }
        
        UIView.animate(withDuration: transitionDuration) { [weak self] in
            guard let self else { return }
            presentedView.frame = initialFrameForPresentedView
        } completion: { [weak self] _ in
            guard let self else { return }
            presentedViewController.dismiss(animated: false)
            isDismissing = false
        }
    }
}
