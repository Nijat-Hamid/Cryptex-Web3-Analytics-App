//
//  BaseViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine

class BaseMenuViewController: BaseLoadingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
      
    }
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
        NSLayoutConstraint.activate([
            menuButton.widthAnchor.constraint(equalToConstant: 24),
            menuButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
}

extension BaseMenuViewController:UIViewControllerTransitioningDelegate{
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return SlideRightPresenter(presentedViewController: presented, presenting: presenting)
    }
}

