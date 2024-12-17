//
//  BlockchainCell.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/15/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SDWebImage

class BlockchainCell: UICollectionViewCell {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    
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
    
    private lazy var primaryStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .top
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "Blockchain:"
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
                label.text = "Daily:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Weekly:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Monthly:"
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
    
    private lazy var daily:UILabel = {
        let label = UILabel()
        label.text = "3848B"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var weekly:UILabel = {
        let label = UILabel()
        label.text = "199K"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var monthly:UILabel = {
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
                label.text = "TVL:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Market Share:"
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
    
    private lazy var tvl:UILabel = {
        let label = UILabel()
        label.text = "9.56%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var marketShare:UILabel = {
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
    
    private lazy var background:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardBackgroundDark
        view.applyCornerRadiusWithShadow()
        return view
    }()
    
    func configure(with blockchain:BlockchainsUIModel){
        print(blockchain)
        
    }
    
    private func setupUI(){
        chainStack.addArrangedSubview(chainImage)
        chainStack.addArrangedSubview(chainName)
        
        primaryStack.addArrangedSubview(chainStack)
        
        secondaryStack.addArrangedSubview(daily)
        secondaryStack.addArrangedSubview(weekly)
        secondaryStack.addArrangedSubview(monthly)
        
        tertiaryStack.addArrangedSubview(tvl)
        tertiaryStack.addArrangedSubview(marketShare)
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
