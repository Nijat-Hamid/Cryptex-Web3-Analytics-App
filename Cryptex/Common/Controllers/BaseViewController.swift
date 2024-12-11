//
//  BaseViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BaseViewController: CustomTransitionViewController {

    private var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let navC = MenuViewController()
        navC.modalPresentationStyle = .custom
        navC.transitioningDelegate = self
        present(navC, animated: true)
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
    
    
}

extension BaseViewController:UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SlideRightPresenter(presentedViewController: presented, presenting: presenting)
    }
}

