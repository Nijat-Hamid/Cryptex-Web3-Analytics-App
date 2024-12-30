//
//  OverviewViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class OverviewViewController: BaseSidePageViewController {

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
    
    private lazy var protocolGeneralView = ProtocolGeneralView()
    private lazy var dropdown = CustomDropdownView()
    
    private func setupUI(){
        navigationItem.title = "Overview"
//        dropdown.translatesAutoresizingMaskIntoConstraints = false
//        dropdown.options = ["Option 1", "Option 2", "Option 3", "Option 4"]
        view.addSubview(protocolGeneralView)
        view.addSubview(dropdown)
        NSLayoutConstraint.activate([
            protocolGeneralView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,constant: 2),
            protocolGeneralView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
            protocolGeneralView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -14),
            protocolGeneralView.heightAnchor.constraint(equalToConstant: 300),
            
            dropdown.topAnchor.constraint(equalTo: protocolGeneralView.bottomAnchor,constant: 24),
//            dropdown.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor,constant: 14),
//            dropdown.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor,constant: -14),
            dropdown.widthAnchor.constraint(equalToConstant: 300),
            dropdown.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            

        ])
    }

}
