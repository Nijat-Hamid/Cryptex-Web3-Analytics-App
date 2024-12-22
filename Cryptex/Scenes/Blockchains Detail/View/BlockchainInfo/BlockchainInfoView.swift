//
//  BlockchainInfo.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/20/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class BlockchainInfoView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyCornerRadiusWithShadow()
    }

    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
         {
                let label = UILabel()
                label.text = "TVL"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "TVL Changes"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Wallets"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),
        ])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .brandSecondary
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var secondaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
         {
                let label = UILabel()
                label.text = "Contract"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Creation"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Cap/TVL"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),
        ])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .brandSecondary
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var tetriaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
         {
                let label = UILabel()
                label.text = "Market Share"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Market Cap"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Risk"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),
        ])
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .brandSecondary
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var primaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var secondaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var tetriaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.backgroundColor = .clear
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    
    private lazy var leftInfoStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var blockchainImage:UIImageView = {
        let tokenImage = UIImageView(image: .chainDemo)
        tokenImage.translatesAutoresizingMaskIntoConstraints = false
        tokenImage.contentMode = .scaleAspectFit
        tokenImage.backgroundColor = .cardBackgroundDark
        tokenImage.layer.borderWidth = 3
        tokenImage.layer.borderColor = UIColor.border.cgColor
        tokenImage.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            tokenImage.widthAnchor.constraint(equalToConstant: 50),
            tokenImage.heightAnchor.constraint(equalToConstant: 50),
        ])
        return tokenImage
    }()
    
    
    private lazy var blockchainName:UILabel = {
        let label = UILabel()
        label.text = "Ethereum"
        label.numberOfLines = 3
        label.font = UIFont(name: "Geist-medium", size: 16)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var contractAddress:UILabel = {
        let label = UILabel()
        label.text = "0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f".truncateMiddle(maxLength: 14)
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textAlignment = .center
        label.textColor = .foreground
        return label
    }()
    

    private lazy var tvl:UILabel = {
        let label = UILabel()
        label.text = "$53.44B"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var tvlChanges:UILabel = {
        let label = UILabel()
        label.text = "1.09%"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var creationDate:UILabel = {
        let label = UILabel()
        label.text = "3 May 2021"
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var wallets:UILabel = {
        let label = UILabel()
        label.text = "N/A"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var capTvl:UILabel = {
        let label = UILabel()
        label.text = "1.11"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
   
    private lazy var marketShare:UILabel = {
        let label = UILabel()
        label.text = "2.88%"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var marketCap:UILabel = {
        let label = UILabel()
        label.text = "$2.96B"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var riskLabel:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
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
        translatesAutoresizingMaskIntoConstraints = false
       
        leftInfoStack.addArrangedSubview(blockchainImage)
        leftInfoStack.addArrangedSubview(blockchainName)
        
        
        primaryStack.addArrangedSubview(tvl)
        primaryStack.addArrangedSubview(tvlChanges)
        primaryStack.addArrangedSubview(wallets)
        
        secondaryStack.addArrangedSubview(contractAddress)
        secondaryStack.addArrangedSubview(creationDate)
        secondaryStack.addArrangedSubview(capTvl)
        
        tetriaryStack.addArrangedSubview(marketShare)
        tetriaryStack.addArrangedSubview(marketCap)
        tetriaryStack.addArrangedSubview(riskContainer)
        
        addSubview(leftInfoStack)
        addSubview(primaryHeader)
        addSubview(primaryStack)
        addSubview(secondaryHeader)
        addSubview(secondaryStack)
        addSubview(tetriaryHeader)
        addSubview(tetriaryStack)
        NSLayoutConstraint.activate([
            
            leftInfoStack.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            leftInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            leftInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            primaryHeader.topAnchor.constraint(equalTo: leftInfoStack.bottomAnchor,constant: 12),
            primaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            primaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            primaryStack.topAnchor.constraint(equalTo: primaryHeader.bottomAnchor, constant: 8),
            primaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            primaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),

            secondaryHeader.topAnchor.constraint(equalTo: primaryStack.bottomAnchor, constant: 8),
            secondaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            secondaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            secondaryStack.topAnchor.constraint(equalTo: secondaryHeader.bottomAnchor, constant: 8),
            secondaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            secondaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            tetriaryHeader.topAnchor.constraint(equalTo: secondaryStack.bottomAnchor, constant: 8),
            tetriaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tetriaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            tetriaryStack.topAnchor.constraint(equalTo: tetriaryHeader.bottomAnchor, constant: 8),
            tetriaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tetriaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            tetriaryStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }

}
