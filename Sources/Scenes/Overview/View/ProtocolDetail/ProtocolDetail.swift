//
//  ProtocolDetail.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/24/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit

class ProtocolDetail: UIStackView {
    
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
    
    weak var delegate:PickerButtonDelegate?{
        set {
            versionPicker.delegate = newValue
        }
        get {
            versionPicker.delegate
        }
    }
    
    private lazy var versionStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        return stack
    }()
    
    private lazy var versionLabel:UILabel = {
        let label = UILabel()
        label.text = "Change Version:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 16)
        label.textColor = .mutedForeground
        return label
    }()
    
     lazy var versionPicker:PickerButton = {
        let picker = PickerButton()
        picker.sheetType = .protocolVersion
        picker.axis = .horizontal
        picker.distribution = .fill
        picker.alignment = .center
        return picker
    }()
    
    private lazy var headerItemOne:UILabel = {
        let label = UILabel()
        label.text = "TVL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var headerItemTwo:UILabel = {
        let label = UILabel()
        label.text = "TVL Change"
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
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var primaryItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
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
    
    private lazy var secondaryItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    private lazy var tetriaryItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var tetriaryItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var tetriaryStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    

    private lazy var tetriaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
        
    }()
    
    private lazy var tetriaryHeaderItemTwo:UILabel = {
        let label = UILabel()
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
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 4, left: 0, bottom: 4, right: 0)
        return stack
    }()
    
    
    func configure(with data:OverviewDetailModel){
        
        switch data {
        case .lendingModel(let lending):
            let formattedTvl = Formatter.number(lending.tvl, as: .currency)
            primaryItemOne.text = formattedTvl
            primaryItemTwo.updateColorBasedOnChanges(lending.historicalTvlChanges.daily)
            
            secondaryHeaderItemOne.text = "Total Supply"
            secondaryHeaderItemTwo.text = "Supply Change"
            
            let formattedTotalDeposit = Formatter.number(lending.totalDepositedAmountAll, as: .currency)
            secondaryItemOne.text = formattedTotalDeposit
            secondaryItemTwo.updateColorBasedOnChanges(lending.historicalDepositAmountChanges.daily)
            
            tetriaryHeaderItemOne.text = "Total Borrow"
            tetriaryHeaderItemTwo.text = "Borrow Change"
            
            let formattedTotalBorrowed = Formatter.number(lending.currentTotalBorrowed, as: .currency)
            tetriaryItemOne.text = formattedTotalBorrowed
            tetriaryItemTwo.updateColorBasedOnChanges(lending.historicalTotalBorrowedChanges.daily)
            
            
        case .dexModel(let dex):
            let formattedTvl = Formatter.number(dex.tvl, as: .currency)
            primaryItemOne.text = formattedTvl
            primaryItemTwo.updateColorBasedOnChanges(dex.historicalTvlChanges.daily)
            
            secondaryHeaderItemOne.text = "Total Volume"
            secondaryHeaderItemTwo.text = "Volume Change"
            
            let formattedVolume = Formatter.number(dex.volumeTotal24h, as: .currency)
            secondaryItemOne.text = formattedVolume
            secondaryItemTwo.updateColorBasedOnChanges(dex.historicalVolumeChanges.daily)
            
            tetriaryHeaderItemOne.text = "Total Fee"
            tetriaryHeaderItemTwo.text = "Fee Change"
            
            let formattedFee = Formatter.number(dex.fee, as: .currency)
            tetriaryItemOne.text = formattedFee
            tetriaryItemTwo.updateColorBasedOnChanges(dex.feeChanges.daily)
        
        }
       
    }
    
    private func setupUI(){
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 6
        alignment = .fill
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        backgroundColor = .cardBackgroundDark
        
        versionStack.addArrangedSubview(versionLabel)
        versionStack.addArrangedSubview(versionPicker)
        
        primaryHeader.addArrangedSubview(headerItemOne)
        primaryHeader.addArrangedSubview(headerItemTwo)
        
        primaryStack.addArrangedSubview(primaryItemOne)
        primaryStack.addArrangedSubview(primaryItemTwo)
        
        secondaryHeader.addArrangedSubview(secondaryHeaderItemOne)
        secondaryHeader.addArrangedSubview(secondaryHeaderItemTwo)
        
        secondaryStack.addArrangedSubview(secondaryItemOne)
        secondaryStack.addArrangedSubview(secondaryItemTwo)
        
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemOne)
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemTwo)
        
        tetriaryStack.addArrangedSubview(tetriaryItemOne)
        tetriaryStack.addArrangedSubview(tetriaryItemTwo)
        
        addArrangedSubview(versionStack)
        addArrangedSubview(primaryHeader)
        addArrangedSubview(primaryStack)
        addArrangedSubview(secondaryHeader)
        addArrangedSubview(secondaryStack)
        addArrangedSubview(tetriaryHeader)
        addArrangedSubview(tetriaryStack)
    }
    
}
