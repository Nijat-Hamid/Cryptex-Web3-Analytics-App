//
//  ProtocolGeneralView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class ProtocolGeneralView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private lazy var poolStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private lazy var poolInfoStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    
    private lazy var poolImageContainer:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        
        container.addSubview(poolImage)
        if !poolImageOther.isHidden {
            container.addSubview(poolImageOther)
            
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 70),
                poolImage.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -20),
                poolImageOther.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 20),
            ])
        } else {
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 70),
                poolImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            ])
        }
        
        return container
    }()
    private lazy var poolImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "poolDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 70),
            image.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        return image
    }()
    
    private lazy var poolImageOther:UIImageView = {
        let image = UIImageView(image: UIImage(named: "retDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.layer.cornerRadius = 35
        image.isHidden = true
        image.clipsToBounds = true
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 70),
            image.widthAnchor.constraint(equalToConstant: 70)
        ])
        return image
    }()
    
    private lazy var poolName:UILabel = {
        let label = UILabel()
        label.text = "WSTETH"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 16)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var poolSecondInfo:UILabel = {
        let label = UILabel()
        label.text = "37483$"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 12)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var chainStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        
        return stack
    }()
    
    private lazy var chainImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "chainDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50)
        ])
        return image
    }()
    
    private lazy var chainName:UILabel = {
        let label = UILabel()
        label.text = "Ethereum"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
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
        let image = UIImageView(image: UIImage(named: "protocolDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        NSLayoutConstraint.activate([
            image.heightAnchor.constraint(equalToConstant: 50),
            image.widthAnchor.constraint(equalToConstant: 50)
        ])
        return image
    }()
    
    private lazy var protocolName:UILabel = {
        let label = UILabel()
        label.text = "Aave V3"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var primaryStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let label = UILabel()
                label.text = "Protocol:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Pool:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Chain:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),
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
    
    
    private lazy var secondaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let label = UILabel()
                label.text = "Supplied:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Borrowed:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Liquidity:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),
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
    
    
    private lazy var secondaryStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var supplied:UILabel = {
        let label = UILabel()
        label.text = "3848B"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var borrowed:UILabel = {
        let label = UILabel()
        label.text = "199K"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var liquidity:UILabel = {
        let label = UILabel()
        label.text = "35K"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var tertiaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let label = UILabel()
                label.text = "Utilization:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "APY:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Risk:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),
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
    
    private lazy var tertiaryStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var utilization:UILabel = {
        let label = UILabel()
        label.text = "9.56%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var apy:UILabel = {
        let label = UILabel()
        label.text = "1.58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var riskLabel:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.updateColorBasedOnRisk()
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 22),
            label.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        return label
    }()
    
    private lazy var riskContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(riskLabel)
        NSLayoutConstraint.activate([
            riskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            riskLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }()
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        self.applyCornerRadiusWithShadow()
        translatesAutoresizingMaskIntoConstraints = false
        
        poolInfoStack.addArrangedSubview(poolName)
        poolInfoStack.addArrangedSubview(poolSecondInfo)
        
        
        poolStack.addArrangedSubview(poolImageContainer)
        poolStack.addArrangedSubview(poolInfoStack)
        
        chainStack.addArrangedSubview(chainImage)
        chainStack.addArrangedSubview(chainName)
        
        protocolStack.addArrangedSubview(protocolImage)
        protocolStack.addArrangedSubview(protocolName)
        
        
        primaryStack.addArrangedSubview(protocolStack)
        primaryStack.addArrangedSubview(poolStack)
        primaryStack.addArrangedSubview(chainStack)
        
        secondaryStack.addArrangedSubview(supplied)
        secondaryStack.addArrangedSubview(borrowed)
        secondaryStack.addArrangedSubview(liquidity)
        
        tertiaryStack.addArrangedSubview(utilization)
        tertiaryStack.addArrangedSubview(apy)
        tertiaryStack.addArrangedSubview(riskContainer)
        
        addSubview(primaryHeader)
        addSubview(primaryStack)
        addSubview(secondaryHeader)
        addSubview(secondaryStack)
        addSubview(tertiaryHeader)
        addSubview(tertiaryStack)
        
        NSLayoutConstraint.activate([
            primaryHeader.topAnchor.constraint(equalTo: topAnchor,constant: 10),
            primaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            primaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            primaryStack.topAnchor.constraint(equalTo: primaryHeader.bottomAnchor,constant: 12),
            primaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            primaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            secondaryHeader.topAnchor.constraint(equalTo: primaryStack.bottomAnchor, constant: 14),
            secondaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            secondaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            secondaryStack.topAnchor.constraint(equalTo: secondaryHeader.bottomAnchor, constant: 10),
            secondaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            secondaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            tertiaryHeader.topAnchor.constraint(equalTo: secondaryStack.bottomAnchor, constant: 10),
            tertiaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            tertiaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
            tertiaryStack.topAnchor.constraint(equalTo: tertiaryHeader.bottomAnchor, constant: 10),
            tertiaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            tertiaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6),
            
        ])
    }
}
