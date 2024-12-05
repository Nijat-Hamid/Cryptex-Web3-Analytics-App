//
//  BaseViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BaseViewController: BaseTransitionViewController {

    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subsribeToProtocolID()
        
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
      
    }
    
    lazy var progress: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.hidesWhenStopped = true
        progress.style = .large
        progress.color = .foreground
        progress.alpha = 0.5
        return progress
    }()
    
    private lazy var menuButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for:.normal)
        button.addTarget(self, action: #selector(openMenu), for: .touchUpInside)
        return button
    }()
    
    @objc private func openMenu (_ sender:UIButton) {
        let vc = MenuViewController()
        vc.modalPresentationStyle = .custom
        vc.transitioningDelegate = self
        present(vc, animated: true)
    }
    

    private func setupUI(){
        let customMenuButtonItem = UIBarButtonItem(customView: menuButton)
        navigationItem.leftBarButtonItem = customMenuButtonItem
        view.backgroundColor = .background
        view.addSubview(progress)
        NSLayoutConstraint.activate([
            progress.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            progress.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            menuButton.widthAnchor.constraint(equalToConstant: 24),
            menuButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
    
    private func subsribeToProtocolID(){
        AppState.shared.protocolIDPublisher.removeDuplicates().sink { [weak self] value in
            guard let self else {return}
            if value.isEmpty {
                navigateToRoot()
            }
            
        }.store(in: &cancellables)
    }
    
    private func navigateToRoot() {
        guard navigationController != nil else { return }
        
        DispatchQueue.main.async { [weak self] in
            guard let self,
                  let navigationController = self.navigationController
            else { return }
            
            let rootViewController = RootViewController()
            
            var viewControllers = navigationController.viewControllers
            viewControllers.removeAll { $0 is RootViewController == false }
            
            if let existingRootVC = viewControllers.first(where: { $0 is RootViewController }) {
                navigationController.popToViewController(existingRootVC, animated: true)
            } else {
                navigationController.pushViewController(rootViewController, animated: true)
            }
        }
    }
}

extension BaseViewController:UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SlideRightPresenter(presentedViewController: presented, presenting: presenting)
    }
}

