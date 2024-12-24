//
//  PoolCell.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/12/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SDWebImage

class PoolCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.applyCornerRadiusWithShadow()
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
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
        
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
        
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 70, height: 70))
        }
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
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
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
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
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
                label.text = "Protocol"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Pool"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Chain"
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
                label.text = "Supplied"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Borrowed"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Liquidity"
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
    
    private lazy var primaryItemOne:UILabel = {
        let label = UILabel()
        label.text = "3848B"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemTwo:UILabel = {
        let label = UILabel()
        label.text = "199K"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemThree:UILabel = {
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
                label.text = "Utilization"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "APY"
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
    
    private lazy var secondaryItemOne:UILabel = {
        let label = UILabel()
        label.text = "9.56%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemTwo:UILabel = {
        let label = UILabel()
        label.text = "1.58%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemThree:UILabel = {
        let label = UILabel()
        label.text = "F"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.updateColorBasedOnRisk()
        label.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 24, height: 22))
        }
        return label
    }()
    
    private lazy var riskContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(secondaryItemThree)
        NSLayoutConstraint.activate([
            secondaryItemThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondaryItemThree.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        return view
    }()
    
    private lazy var clickText:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Click to Details"
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 10)
        label.textColor = .mutedForeground
        return label
    }()
    
    func configure(with pool:PoolsUIModels){
        guard
            let secondaryHeaderLabelOne = secondaryHeader.arrangedSubviews[safe: 0] as? UILabel,
            let secondaryHeaderLabelTwo = secondaryHeader.arrangedSubviews[safe: 1] as? UILabel,
            let secondaryHeaderLabelThree = secondaryHeader.arrangedSubviews[safe: 2] as? UILabel,
            let tertiaryHeaderLabelOne = tertiaryHeader.arrangedSubviews[safe: 0] as? UILabel
        else {return}
        
        switch pool {
        case .lendingUIModel:
            secondaryHeaderLabelOne.text = "Supplied"
            secondaryHeaderLabelTwo.text = "Borrowed"
            secondaryHeaderLabelThree.text = "Liquidity"
            tertiaryHeaderLabelOne.text = "Utilization"
        case .dexUIModel:
            secondaryHeaderLabelOne.text = "TVL"
            secondaryHeaderLabelTwo.text = "Volume"
            secondaryHeaderLabelThree.text = "Vol/TVL"
            tertiaryHeaderLabelOne.text = "Fees"
        }
        
    }
    
    private lazy var background:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardBackgroundDark
        return view
    }()
    
    
    private func setupUI(){
        
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
        
        secondaryStack.addArrangedSubview(primaryItemOne)
        secondaryStack.addArrangedSubview(primaryItemTwo)
        secondaryStack.addArrangedSubview(primaryItemThree)
        
        tertiaryStack.addArrangedSubview(secondaryItemOne)
        tertiaryStack.addArrangedSubview(secondaryItemTwo)
        tertiaryStack.addArrangedSubview(riskContainer)
        
        background.addSubview(primaryHeader)
        background.addSubview(primaryStack)
        background.addSubview(secondaryHeader)
        background.addSubview(secondaryStack)
        background.addSubview(tertiaryHeader)
        background.addSubview(tertiaryStack)
        background.addSubview(clickText)
        addSubview(background)
        NSLayoutConstraint.activate([
            primaryHeader.topAnchor.constraint(equalTo: topAnchor,constant: 12),
            primaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            primaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            primaryStack.topAnchor.constraint(equalTo: primaryHeader.bottomAnchor,constant: 12),
            primaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            primaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            secondaryHeader.topAnchor.constraint(equalTo: primaryStack.bottomAnchor, constant: 14),
            secondaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            secondaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            secondaryStack.topAnchor.constraint(equalTo: secondaryHeader.bottomAnchor, constant: 10),
            secondaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            secondaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            tertiaryHeader.topAnchor.constraint(equalTo: secondaryStack.bottomAnchor, constant: 10),
            tertiaryHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tertiaryHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            tertiaryStack.topAnchor.constraint(equalTo: tertiaryHeader.bottomAnchor, constant: 10),
            tertiaryStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            tertiaryStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            clickText.topAnchor.constraint(equalTo: tertiaryStack.bottomAnchor, constant: 10),
            clickText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            clickText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),

            background.topAnchor.constraint(equalTo: topAnchor,constant: 2),
            background.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -2),
            background.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 2),
            background.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -2)
        ])
    }
}
