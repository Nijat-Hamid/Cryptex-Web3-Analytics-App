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
    
    private lazy var poolName:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var poolSecondInfo:UILabel = {
        let label = UILabel()
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
    
    private lazy var secondaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryHeader:UIStackView = {
        let stack = UIStackView()
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemThree:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    
    private lazy var tertiaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tertiaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "APY"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tertiaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "Risk"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tertiaryHeader:UIStackView = {
        let stack = UIStackView()
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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemThree:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
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
    
    private lazy var background:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .cardBackgroundDark
        return view
    }()
    
    
    
    func configure(with pool:PoolsCombinedSingleUIModel){
        
        switch pool {
        case .lendingUIModel(let lending):
            secondaryHeaderItemOne.text = "Supplied"
            secondaryHeaderItemTwo.text = "Borrowed"
            secondaryHeaderItemThree.text = "Liquidity"
            tertiaryHeaderItemOne.text = "Utilization"
            
            poolImageContainer.poolImageArranger(with: [poolImage], isSingle: true)
            
            let formattedSupplied = Formatter.number(lending.totalLiqiudityUSD, as: .currency)
            let formattedBorrowed = Formatter.number(lending.totalBorrowedTokenUSD, as: .currency)
            let formattedLiquidity = Formatter.number(lending.tvlUSD, as: .currency)
            let formattedUtilization = Formatter.number(lending.utilizationRate, as: .percentage)
            let formattedApy = Formatter.number(lending.apyMean30d, as: .percentage)
            let formattedPrice = Formatter.number(lending.poolPrice, as: .currency)
            primaryItemOne.text = formattedSupplied
            primaryItemTwo.text = formattedBorrowed
            primaryItemThree.text = formattedLiquidity
            secondaryItemOne.text = formattedUtilization
            secondaryItemTwo.text = formattedApy
            poolSecondInfo.text = formattedPrice
            
            chainName.text = lending.chain.capitalized
            poolName.text = lending.symbol
            protocolName.text = lending.protocolFullName
            
            secondaryItemThree.updateColorBasedOnRisk(rating: lending.overalRisk )
            chainImage.sd_setImage(with: URL.fromBase(lending.protocolChainLogo))
            protocolImage.sd_setImage(with: URL.fromBase(lending.protocolLogo))
            poolImage.sd_setImage(with: URL.fromBase(lending.poolLogo[0]))
            
        case .dexUIModel(let dex):
            secondaryHeaderItemOne.text = "TVL"
            secondaryHeaderItemTwo.text = "Volume"
            secondaryHeaderItemThree.text = "Vol/TVL"
            tertiaryHeaderItemOne.text = "Fees"
            
            poolImageContainer.poolImageArranger(with: [poolImage,poolImageOther], isSingle: false)
            
            let formattedTvl = Formatter.number(dex.tvlUSD, as: .currency)
            let formattedVolume = Formatter.number(dex.currentVolume, as: .currency)
            let formattedVolTvl = Formatter.number(dex.volTvl, as: .decimal)
            let formattedFees = Formatter.number(dex.currentFee, as: .currency)
            let formattedTradingFee = Formatter.number(dex.tradingFee, as: .percentage)
            let formattedApy = Formatter.number(dex.apyMean30d, as: .percentage)
            primaryItemOne.text = formattedTvl
            primaryItemTwo.text = formattedVolume
            primaryItemThree.text = formattedVolTvl
            secondaryItemOne.text = formattedFees
            secondaryItemTwo.text = formattedApy
            poolSecondInfo.text = formattedTradingFee
            
            
            chainName.text = dex.chain.capitalized
            poolName.text = dex.poolName
            protocolName.text = dex.protocolFullName
            
            
            secondaryItemThree.updateColorBasedOnRisk(rating: dex.overalRisk)
            chainImage.sd_setImage(with: URL.fromBase(dex.protocolChainLogo))
            protocolImage.sd_setImage(with: URL.fromBase(dex.protocolLogo))
            poolImage.sd_setImage(with: URL.fromBase(dex.poolLogo[0]))
            poolImageOther.sd_setImage(with: URL.fromBase(dex.poolLogo[1]))
        }
    }
    
    
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
        
        secondaryHeader.addArrangedSubview(secondaryHeaderItemOne)
        secondaryHeader.addArrangedSubview(secondaryHeaderItemTwo)
        secondaryHeader.addArrangedSubview(secondaryHeaderItemThree)
        
        secondaryStack.addArrangedSubview(primaryItemOne)
        secondaryStack.addArrangedSubview(primaryItemTwo)
        secondaryStack.addArrangedSubview(primaryItemThree)
        
        tertiaryHeader.addArrangedSubview(tertiaryHeaderItemOne)
        tertiaryHeader.addArrangedSubview(tertiaryHeaderItemTwo)
        tertiaryHeader.addArrangedSubview(tertiaryHeaderItemThree)
        
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
