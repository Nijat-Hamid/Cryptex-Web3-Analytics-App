//
//  ProtocolGeneralView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit

class ProtocolGeneral: UIStackView {
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadiusWithShadow()
    }
    
    private lazy var protocolStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
  
    private lazy var protocolImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
     
    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let label = UILabel()
                label.text = "Protocol"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }()
        ])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .brandSecondary
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    
    func configure(with protocolType:String){
        switch protocolType {
        case "Lending":
            protocolImage.image = UIImage(resource: .aave)
        case "Dex":
            protocolImage.image = UIImage(resource: .uniswap)
        default: break
        }
    }
    
    private func setupUI(){
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 16
        alignment = .fill
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 24, right: 8)
        backgroundColor = .cardBackgroundDark
        
        protocolImage.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        protocolStack.addArrangedSubview(protocolImage)
        
        addArrangedSubview(primaryHeader)
        addArrangedSubview(protocolStack)
        
    }
}
