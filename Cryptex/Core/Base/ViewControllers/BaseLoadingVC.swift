//
//  BaseLoadingViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BaseLoadingVC: BaseErrorViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private lazy var overlayView: UIView = {
        let overlay = UIView()
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlay.backgroundColor = .background
        overlay.isHidden = true
        return overlay
    }()
    
    
    
    private lazy var progress: UIActivityIndicatorView = {
        let progress = UIActivityIndicatorView()
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.hidesWhenStopped = true
        progress.style = .large
        progress.color = .foreground
        progress.alpha = 0.5
        return progress
    }()
    
    
    
    private func setupUI() {
        view.addSubview(overlayView)
        overlayView.addSubview(progress)
        
        NSLayoutConstraint.activate([
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            progress.centerXAnchor.constraint(equalTo: overlayView.centerXAnchor),
            progress.centerYAnchor.constraint(equalTo: overlayView.centerYAnchor)
        ])
    }
    
    func showLoading() {
        overlayView.isHidden = false
        progress.startAnimating()
    }
    
    func hideLoading() {
        overlayView.isHidden = true
        progress.stopAnimating()
    }
}
