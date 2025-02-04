//
//  ProtocolChainBased.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/24/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import UIKit
import Combine
import SnapKit

class ProtocolChainStatistics: UIStackView {

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
            chainPicker.delegate = newValue
        }
        get {
            chainPicker.delegate
        }
    }
    
    private lazy var chainStack:UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.spacing = 16
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)
        return stack
    }()
    
    private lazy var chainLabel:UILabel = {
        let label = UILabel()
        label.text = "Change Chain:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-semibold", size: 16)
        label.textColor = .mutedForeground
        return label
    }()
    
    
      lazy var chainPicker:PickerButton = {
        let picker = PickerButton()
        picker.sheetType = .chain
        picker.axis = .horizontal
        picker.distribution = .fill
        picker.alignment = .center
        return picker
    }()
    
    private lazy var primaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var primaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "TVL"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var primaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "TVL Change"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
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
    
    private lazy var primaryStackItemOne:UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryStackItemTwo:UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var primaryStackItemThree:UILabel = {
        let label = UILabel()
        label.text = "123"
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
        label.text = "APY"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "Contract"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var secondaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "Creation Date"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
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
    
    private lazy var secondaryStackItemOne:UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryStackItemTwo:UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var secondaryStackItemThree:UILabel = {
        let label = UILabel()
        label.text = "123"
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
    
    private lazy var tetriaryHeaderItemOne:UILabel = {
        let label = UILabel()
        label.text = "Number of Pools"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tetriaryHeaderItemTwo:UILabel = {
        let label = UILabel()
        label.text = "Time Risk"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .mutedForeground
        return label
    }()
    
    private lazy var tetriaryHeaderItemThree:UILabel = {
        let label = UILabel()
        label.text = "Overall Risk"
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
    
    private lazy var tetriaryStackItemOne:UILabel = {
        let label = UILabel()
        label.text = "123"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var tetriaryStackItemTwo:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.text = "A"
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        label.layer.borderWidth = 1
        label.snp.makeConstraints { make in
            make.size.equalTo(CGSize(width: 24, height: 22))
        }
        return label
    }()
    
    private lazy var timeRiskContainer:UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tetriaryStackItemTwo)
        tetriaryStackItemTwo.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return view
    }()
    
    private lazy var tetriaryStackItemThree:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = .zero
        label.text = "A"
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
        
        view.addSubview(tetriaryStackItemThree)
        tetriaryStackItemThree.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        return view
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
    
    private var cancellables = Set<AnyCancellable>()
    private var currentChain:ProtocolChains.RawValue = ""
    private var protocolData:OverviewStatisticsModel?
    
    private func chainSubscription (){
        AppState.shared.selectedChain
            .receive(on: DispatchQueue.main)
            .sink { [weak self] chain in
                guard let self else {return}
                currentChain = chain
                updateDataWithChain()
            }
            .store(in: &cancellables)
    }
    
    
    func configure(with data:OverviewStatisticsModel){
        switch data {
        case .lendingModel(let lending):
            protocolData = .lendingModel(lending)
        case .dexModel(let dex):
            protocolData = .dexModel(dex)
        }
        updateDataWithChain()
    }
    
    private func updateDataWithChain(){
        guard let data = protocolData else {return}
        
        switch data {
        case .lendingModel(let lending):
            
            
            primaryStackItemOne.text = lending.type
            
            let formattedTvl = Formatter.number(lending.currentChainTvls[currentChain] ?? 0, as: .currency)
            primaryStackItemTwo.text = formattedTvl
            
            primaryStackItemThree.updateColorBasedOnChanges(lending.chainTvlChanges[currentChain]?.daily ?? 0)
            
            secondaryStackItemThree.text = lending.creationDate[currentChain] ?? "N/A"
            secondaryStackItemTwo.text = lending.contract[currentChain]?.truncateMiddle(maxLength: 14)
            let averageApy = Formatter.number(lending.averageApy[currentChain] ?? 0, as: .percentage)
            
            secondaryStackItemOne.text = averageApy
            
            tetriaryStackItemThree.updateColorBasedOnRisk(rating: lending.overalRisk[currentChain] ?? "-")
            tetriaryStackItemTwo.updateColorBasedOnRisk(rating: lending.timeRisk)
            tetriaryStackItemOne.text = "\(lending.poolsNumber[currentChain] ?? 0)"
            
            
        case .dexModel(let dex):
            primaryStackItemOne.text = dex.type
            
            let formattedTvl = Formatter.number(dex.currentChainTvls[currentChain] ?? 0, as: .currency)
            primaryStackItemTwo.text = formattedTvl
            
            primaryStackItemThree.updateColorBasedOnChanges(dex.chainTvlChanges[currentChain]?.daily ?? 0)
            
            secondaryStackItemThree.text = dex.creationDate[currentChain] ?? "N/A"
            secondaryStackItemTwo.text = dex.contract[currentChain]?.truncateMiddle(maxLength: 14)
            let averageApy = Formatter.number(dex.averageApy[currentChain] ?? 0, as: .percentage)
            
            secondaryStackItemOne.text = averageApy
            
            tetriaryStackItemThree.updateColorBasedOnRisk(rating: dex.overalRisk[currentChain] ?? "-")
            tetriaryStackItemTwo.updateColorBasedOnRisk(rating: dex.timeRisk)
            tetriaryStackItemOne.text = "\(dex.poolsNumber[currentChain] ?? 0)"
        }
    }
    
    
    private func setupUI(){
        chainSubscription()
        axis = .vertical
        translatesAutoresizingMaskIntoConstraints = false
        spacing = 6
        alignment = .fill
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .cardBackgroundDark
        
        chainStack.addArrangedSubview(chainLabel)
        chainStack.addArrangedSubview(chainPicker)
        
        primaryHeader.addArrangedSubview(primaryHeaderItemOne)
        primaryHeader.addArrangedSubview(primaryHeaderItemTwo)
        primaryHeader.addArrangedSubview(primaryHeaderItemThree)
        
        primaryStack.addArrangedSubview(primaryStackItemOne)
        primaryStack.addArrangedSubview(primaryStackItemTwo)
        primaryStack.addArrangedSubview(primaryStackItemThree)
        
        secondaryHeader.addArrangedSubview(secondaryHeaderItemOne)
        secondaryHeader.addArrangedSubview(secondaryHeaderItemTwo)
        secondaryHeader.addArrangedSubview(secondaryHeaderItemThree)
        
        secondaryStack.addArrangedSubview(secondaryStackItemOne)
        secondaryStack.addArrangedSubview(secondaryStackItemTwo)
        secondaryStack.addArrangedSubview(secondaryStackItemThree)
        
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemOne)
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemTwo)
        tetriaryHeader.addArrangedSubview(tetriaryHeaderItemThree)
        
        tetriaryStack.addArrangedSubview(tetriaryStackItemOne)
        tetriaryStack.addArrangedSubview(timeRiskContainer)
        tetriaryStack.addArrangedSubview(riskContainer)
        
        addArrangedSubview(chainStack)
        addArrangedSubview(primaryHeader)
        addArrangedSubview(primaryStack)
        addArrangedSubview(secondaryHeader)
        addArrangedSubview(secondaryStack)
        addArrangedSubview(tetriaryHeader)
        addArrangedSubview(tetriaryStack)
        
    }
}
