//
//  PlaceholderViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/6/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class LoadingVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        addInfiniteRotateAnimation(to: animatedLogo)
        performInitialCheck()
    }
    override func loadView() {
        super.loadView()
        setupUI()
    }

    private lazy var animatedLogo:UIImageView = {
        let image = UIImageView(image: UIImage(named: "launch"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private func addInfiniteRotateAnimation(to view: UIView) {
        let rotation = CABasicAnimation(keyPath: "transform.rotation")
        rotation.fromValue = 0
        rotation.toValue = -CGFloat.pi * 2
        rotation.duration = 3.3
        rotation.repeatCount = .infinity
        rotation.isRemovedOnCompletion = false
        view.layer.add(rotation, forKey: "infiniteRotateAnimation")
    }
        
    private func performInitialCheck (){
        let protocolTypes = AppState.shared.getInitialProtocolID()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if protocolTypes.id.isEmpty {
                ContainerState.shared.setPage(to: .defi)
            }else{
                ContainerState.shared.setPage(to: .main)
            }
        }
    }
    
    private func setupUI(){
        view.addSubview(animatedLogo)
        NSLayoutConstraint.activate([
            animatedLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            animatedLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            animatedLogo.heightAnchor.constraint(equalToConstant: 224),
            animatedLogo.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            animatedLogo.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
        ])
    }
}
