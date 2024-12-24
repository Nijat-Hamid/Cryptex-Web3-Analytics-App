//
//  BaseViewController.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/27/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine
import SnapKit
class BaseSidePageViewController: BaseLoadingViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        setupUI()
      
    }
    
    private lazy var sidePageButton:UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "menu"), for:.normal)
        button.addTarget(self, action: #selector(openSidePage), for: .touchUpInside)
        return button
    }()
    
    @objc private func openSidePage (_ sender:UIButton) {
        let vc = AboutViewController()
        vc.title = "About"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupUI(){
        let sideMenuItem = UIBarButtonItem(customView: sidePageButton)
        navigationItem.leftBarButtonItem = sideMenuItem
        sidePageButton.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 24, height: 24))
        }

    }
}


