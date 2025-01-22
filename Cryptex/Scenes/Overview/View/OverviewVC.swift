//
//  OverviewViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class OverviewVC: BaseSidePageVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private var safeAreaLayoutGuide:UILayoutGuide{
        view.safeAreaLayoutGuide
    }
    
    private lazy var protocolGeneralView = ProtocolGeneral()
    private lazy var scrollView:UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceHorizontal = false
        view.alwaysBounceVertical = false
        return view
    }()
    
    private func setupUI(){
        navigationItem.title = "Overview"
        scrollView.addSubview(protocolGeneralView)
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            
            scrollView.contentLayoutGuide.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            protocolGeneralView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 2),
            protocolGeneralView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor, constant: 14),
            protocolGeneralView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor, constant: -14),
            protocolGeneralView.heightAnchor.constraint(equalToConstant: 290),
            protocolGeneralView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -2)
//            protocolGeneralView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
//            protocolGeneralView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -2)
            
            
//            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
//            scrollView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
//            scrollView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
//            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
//            
//            protocolGeneralView.topAnchor.constraint(equalTo: scrollView.topAnchor,constant: 2),
//            protocolGeneralView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 14),
//            protocolGeneralView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -14),
//            protocolGeneralView.heightAnchor.constraint(equalToConstant: 290),
        ])
    }

}
