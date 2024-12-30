//
//  TokenInfoView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class PoolInfoView: UIView {

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
                label.text = "Price"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Price Change"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Holders"
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
                label.text = "Total TX"
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
                label.text = "Market Cap"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Market Changes"
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
    
    private lazy var poolImageContainer:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        
        container.addSubview(poolImage)
        container.addSubview(poolChainImage)
        if !poolImageOther.isHidden {
            container.addSubview(poolImageOther)
            
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 50),
                poolImage.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: -20),
                poolImageOther.centerXAnchor.constraint(equalTo: container.centerXAnchor, constant: 20),
                poolChainImage.widthAnchor.constraint(equalToConstant: 16),
                poolChainImage.heightAnchor.constraint(equalToConstant: 16),
                poolChainImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                poolChainImage.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -2),
            ])
        } else {
            NSLayoutConstraint.activate([
                container.heightAnchor.constraint(equalToConstant: 50),
                poolImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                poolChainImage.widthAnchor.constraint(equalToConstant: 16),
                poolChainImage.heightAnchor.constraint(equalToConstant: 16),
                poolChainImage.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                poolChainImage.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -2),
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
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        
        return image
    }()
    
    private lazy var poolImageOther:UIImageView = {
        let image = UIImageView(image: UIImage(named: "retDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.border.cgColor
        image.layer.cornerRadius = 25
        image.isHidden = false
        image.clipsToBounds = true
        
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        return image
    }()
    
    
    private lazy var poolChainImage:UIImageView = {
        let image = UIImageView(image: .chainDemo)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .cardBackgroundDark
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor.clear.cgColor
        image.layer.cornerRadius = 8
        image.layer.zPosition = 1
        image.clipsToBounds = true
        return image
    }()
    
    
    private lazy var poolNameContainer:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var poolName:UILabel = {
        let label = UILabel()
        label.text = "Wrapped BTC"
        label.numberOfLines = 3
        label.font = UIFont(name: "Geist-medium", size: 16)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var poolType:UILabel = {
        let label = UILabel()
        label.text = "Token"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryItemOne:UILabel = {
        let label = UILabel()
        label.text = "0x2f2a2543B76A4166549F7aaB2e75Bef0aefC5B0f".truncateMiddle(maxLength: 14)
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textAlignment = .center
        label.textColor = .foreground
        return label
    }()
    

    private lazy var primaryItemOne:UILabel = {
        let label = UILabel()
        label.text = "$64,896"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemTwo:UILabel = {
        let label = UILabel()
        label.text = "33%"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemTwo:UILabel = {
        let label = UILabel()
        label.text = "16 Jun 2021"
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var primaryItemThree:UILabel = {
        let label = UILabel()
        label.text = "80.97K"
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var secondaryItemThree:UILabel = {
        let label = UILabel()
        label.text = "4.54M"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
   
    private lazy var tertiaryItemOne:UILabel = {
        let label = UILabel()
        label.text = "$10.07B"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tertiaryItemTwo:UILabel = {
        let label = UILabel()
        label.text = "1.42%"
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tertiaryItemThree:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 22),
            label.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        return label
    }()
    
    private lazy var riskContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tertiaryItemThree)
        NSLayoutConstraint.activate([
            tertiaryItemThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tertiaryItemThree.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }()
    
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        poolNameContainer.addArrangedSubview(poolName)
        poolNameContainer.addArrangedSubview(poolType)
        
        leftInfoStack.addArrangedSubview(poolImageContainer)
        leftInfoStack.addArrangedSubview(poolNameContainer)
        
        
        primaryStack.addArrangedSubview(primaryItemOne)
        primaryStack.addArrangedSubview(primaryItemTwo)
        primaryStack.addArrangedSubview(primaryItemThree)
        
        secondaryStack.addArrangedSubview(secondaryItemOne)
        secondaryStack.addArrangedSubview(secondaryItemTwo)
        secondaryStack.addArrangedSubview(secondaryItemThree)
        
        tetriaryStack.addArrangedSubview(tertiaryItemOne)
        tetriaryStack.addArrangedSubview(tertiaryItemTwo)
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
