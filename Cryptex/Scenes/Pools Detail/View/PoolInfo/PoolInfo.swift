//
//  TokenInfoView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/18/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit

class PoolInfo: UIView {

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
    
    private lazy var primaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.text = "TVL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var primaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "Changes"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var primaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "Depositors"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()

    
    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView()
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
    
    private lazy var stackHeader:UIStackView = {
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
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var mainStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .top
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
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
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 25
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        return image
    }()
    
    private lazy var protocolName:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
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
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        return image
    }()
    
    private lazy var chainName:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
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
    
    private lazy var tetriaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.text = "Market Cap"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tetriaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "APY"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tetriaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "Risk"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tetriaryHeader:UIStackView = {
        let stack = UIStackView()
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
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var poolImageContainer:UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .clear
        return container
    }()
    
    private lazy var poolImage:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
        return image
    }()
    
    private lazy var poolImageOther:UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 25
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 50, height: 50))
        }
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
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var poolType:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 12)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryItemOne:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textAlignment = .center
        label.textColor = .foreground
        return label
    }()
    

    private lazy var primaryItemOne:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemTwo:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemTwo:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    
    private lazy var primaryItemThree:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var secondaryItemThree:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
   
    private lazy var tertiaryItemOne:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tertiaryItemTwo:UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tertiaryItemThree:UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 24, height: 22))
        }
        
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
    
    func configure (with poolDetail:DetailCombinedUIData){
        switch poolDetail {
        case .lending(let lending):
            tetriaryHeaderItemOne.text = "Price"
            primaryHeaderItemThree.text = "Depositors"
            let formattedPrice = Formatter.number(lending.poolPrice, as: .currency)
            let formattedTvl = Formatter.number(lending.tvlUSD, as: .currency)
            let formattedDepositors = Formatter.number(lending.poolDepositors, as: .decimal)
            let formattedTx = Formatter.number(lending.totalTx, as: .decimal)
            let formattedApy = Formatter.number(lending.apy, as: .percentage)
            
            poolName.text = lending.symbol
            tertiaryItemOne.text = formattedPrice
            poolType.text = "Lending"
            primaryItemOne.text = formattedTvl
            primaryItemThree.text = formattedDepositors
            secondaryItemTwo.text = lending.date
            secondaryItemThree.text = formattedTx
            tertiaryItemTwo.text = formattedApy
            
            chainName.text = lending.chain.capitalized
            protocolName.text = lending.protocolFullName
            
            primaryItemTwo.updateColorBasedOnChanges(lending.historicalTvlChanges.daily)
            poolImageContainer.poolImageArranger(with: [poolImage], isSingle: true)
            
            secondaryItemOne.text = lending.poolContract.truncateMiddle(maxLength: 14)
            tertiaryItemThree.updateColorBasedOnRisk(rating: lending.overalRisk)
            chainImage.sd_setImage(with: URL.fromBase(lending.protocolChainLogo))
            poolImage.sd_setImage(with: URL.fromBase(lending.poolLogo[0]))
            protocolImage.sd_setImage(with: URL.fromBase(lending.protocolLogo))
            
        case .dex(let dex):
            primaryHeaderItemThree.text = "LPs"
            tetriaryHeaderItemOne.text = "Fee"
            
            let formattedTradingFee = Formatter.number(dex.tradingFee, as: .percentage)
            let formattedTvl = Formatter.number(dex.tvlUSD, as: .currency)
            let formattedDepositors = Formatter.number(dex.poolDepositors, as: .decimal)
            let formattedTx = Formatter.number(dex.totalTx, as: .decimal)
            let formattedApy = Formatter.number(dex.apy, as: .percentage)
            
            poolName.text = dex.poolName
            tertiaryItemOne.text = formattedTradingFee
            
            poolType.text = "Dex"
            primaryItemOne.text = formattedTvl
            primaryItemThree.text = formattedDepositors
            secondaryItemTwo.text = dex.date
            secondaryItemThree.text = formattedTx
            tertiaryItemTwo.text = formattedApy
            
            chainName.text = dex.chain.capitalized
            protocolName.text = dex.protocolFullName
            
            primaryItemTwo.updateColorBasedOnChanges(dex.historicalTvlChanges.daily)
            poolImageContainer.poolImageArranger(with: [poolImage,poolImageOther], isSingle: false)
            
            secondaryItemOne.text = dex.poolContract.truncateMiddle(maxLength: 14)
            tertiaryItemThree.updateColorBasedOnRisk(rating: dex.overalRisk)
            chainImage.sd_setImage(with: URL.fromBase(dex.protocolChainLogo))
            poolImage.sd_setImage(with: URL.fromBase(dex.poolLogo[0]))
            poolImageOther.sd_setImage(with: URL.fromBase(dex.poolLogo[1]))
            protocolImage.sd_setImage(with: URL.fromBase(dex.protocolLogo))
        }
        
    }
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        
        chainStack.addArrangedSubview(chainImage)
        chainStack.addArrangedSubview(chainName)
        
        protocolStack.addArrangedSubview(protocolImage)
        protocolStack.addArrangedSubview(protocolName)
        
        poolNameContainer.addArrangedSubview(poolName)
        poolNameContainer.addArrangedSubview(poolType)
        
        leftInfoStack.addArrangedSubview(poolImageContainer)
        leftInfoStack.addArrangedSubview(poolNameContainer)
        
        mainStack.addArrangedSubview(protocolStack)
        mainStack.addArrangedSubview(leftInfoStack)
        mainStack.addArrangedSubview(chainStack)
        
        primaryHeader.addArrangedSubview(primaryHeaderItemOne)
        primaryHeader.addArrangedSubview(primaryHeaderItemTwo)
        primaryHeader.addArrangedSubview(primaryHeaderItemThree)
        
        primaryStack.addArrangedSubview(primaryItemOne)
        primaryStack.addArrangedSubview(primaryItemTwo)
        primaryStack.addArrangedSubview(primaryItemThree)
        
        secondaryStack.addArrangedSubview(secondaryItemOne)
        secondaryStack.addArrangedSubview(secondaryItemTwo)
        secondaryStack.addArrangedSubview(secondaryItemThree)
        
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemOne)
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemTwo)
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemThree)
        
        tetriaryStack.addArrangedSubview(tertiaryItemOne)
        tetriaryStack.addArrangedSubview(tertiaryItemTwo)
        tetriaryStack.addArrangedSubview(riskContainer)
        
        addSubview(stackHeader)
        addSubview(mainStack)
        addSubview(primaryHeader)
        addSubview(primaryStack)
        addSubview(secondaryHeader)
        addSubview(secondaryStack)
        addSubview(tetriaryHeader)
        addSubview(tetriaryStack)
        NSLayoutConstraint.activate([
        
            stackHeader.topAnchor.constraint(equalTo: topAnchor,constant: 8),
            stackHeader.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackHeader.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
            mainStack.topAnchor.constraint(equalTo: stackHeader.bottomAnchor,constant: 12),
            mainStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            mainStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            
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
