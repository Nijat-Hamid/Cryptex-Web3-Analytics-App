//
//  ProtocolGeneralView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit
import SnapKit
class ProtocolGeneral: UIView {
    
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
    
    private lazy var protocolInfoStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 2
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private lazy var protocolImage:UIImageView = {
        let image = UIImageView(image: UIImage(named: "protocolDemo"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .cardBackgroundDark
        image.layer.cornerRadius = 30
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 60, height: 60))
        }
        
        return image
    }()
 
    
    private lazy var protocolName:UILabel = {
        let label = UILabel()
        label.text = "Aave"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 16)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var protocolSecondInfo:UILabel = {
        let label = UILabel()
        label.text = "Lending"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 12)
        label.textColor = .mutedForeground
        return label
    }()
    
    
    private lazy var chainPicker:PickerButton = {
        let picker = PickerButton()
        picker.sheetType = .chain
        return picker
    }()
    
    private lazy var versionStack:UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        stack.alignment = .center
        return stack
    }()
    
    private lazy var versionImage:UIImageView = {
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
    
    private lazy var versionName:UILabel = {
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
        stack.alignment = .top
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var primaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
            {
                let label = UILabel()
                label.text = "Version"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
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
    
    
//    func configure(with pool:PoolsUIModels){
//        guard
//            let secondaryHeaderLabelOne = secondaryHeader.arrangedSubviews[safe: 0] as? UILabel,
//            let secondaryHeaderLabelTwo = secondaryHeader.arrangedSubviews[safe: 1] as? UILabel,
//            let secondaryHeaderLabelThree = secondaryHeader.arrangedSubviews[safe: 2] as? UILabel,
//            let tertiaryHeaderLabelOne = tertiaryHeader.arrangedSubviews[safe: 0] as? UILabel
//        else {return}
//        
//        switch pool {
//        case .lendingUIModel:
//            secondaryHeaderLabelOne.text = "Supplied"
//            secondaryHeaderLabelTwo.text = "Borrowed"
//            secondaryHeaderLabelThree.text = "Liquidity"
//            tertiaryHeaderLabelOne.text = "Utilization"
//        case .dexUIModel:
//            secondaryHeaderLabelOne.text = "TVL"
//            secondaryHeaderLabelTwo.text = "Volume"
//            secondaryHeaderLabelThree.text = "Vol/TVL"
//            tertiaryHeaderLabelOne.text = "Fees"
//        }
//    }
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        translatesAutoresizingMaskIntoConstraints = false
        protocolInfoStack.addArrangedSubview(protocolName)
        protocolInfoStack.addArrangedSubview(protocolSecondInfo)
        
        protocolStack.addArrangedSubview(protocolImage)
        protocolStack.addArrangedSubview(protocolInfoStack)
        
        versionStack.addArrangedSubview(versionImage)
        versionStack.addArrangedSubview(versionName)
        
        primaryStack.addArrangedSubview(versionStack)
        primaryStack.addArrangedSubview(protocolStack)
        primaryStack.addArrangedSubview(chainPicker)
        
        secondaryStack.addArrangedSubview(primaryItemOne)
        secondaryStack.addArrangedSubview(primaryItemTwo)
        secondaryStack.addArrangedSubview(primaryItemThree)
        
        tertiaryStack.addArrangedSubview(secondaryItemOne)
        tertiaryStack.addArrangedSubview(secondaryItemTwo)
        tertiaryStack.addArrangedSubview(riskContainer)
        
        addSubview(primaryHeader)
        addSubview(primaryStack)
        addSubview(secondaryHeader)
        addSubview(secondaryStack)
        addSubview(tertiaryHeader)
        addSubview(tertiaryStack)
        
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
            
        ])
    }
}
