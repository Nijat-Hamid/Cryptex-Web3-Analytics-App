//
//  MetricsStatisticsView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MetricsStatistics: UIView {
    
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
    
    private lazy var feeRevenueHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "Fee"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Revenue"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }()
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
    
    private lazy var feeValue:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var revenueValue:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var feeRevenueStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var pfpsRatioHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "P/F Ratio"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "P/S Ratio"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }()
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
    
    private lazy var pfRatio:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var psRatio:UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
        label.textAlignment = .center
        label.font = UIFont(name: "Geist-medium", size: 14)
        label.textColor = .foreground
        return label
    }()
    
    private lazy var pfpsRatioStack:UIStackView = {
        let stack = UIStackView()
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var statisticsContainer:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 6
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        return stack
    }()
    
    func configure(with data:MetricsStatisticsModel){
        let formattedFeeValue = Formatter.number(data.fee.total7d, as: .currency)
        let formattedRevenueValue = Formatter.number(data.revenue.total7d, as: .currency)
        let formattedPFRatio = Formatter.number(data.pfRatio, as: .decimal)
        let formattedPSRatio = Formatter.number(data.psRatio, as: .decimal)
        
        feeValue.text = formattedFeeValue
        revenueValue.text = formattedRevenueValue
        pfRatio.text = formattedPFRatio
        psRatio.text = formattedPSRatio
    }
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        
        feeRevenueStack.addArrangedSubview(feeValue)
        feeRevenueStack.addArrangedSubview(revenueValue)
        
        pfpsRatioStack.addArrangedSubview(pfRatio)
        pfpsRatioStack.addArrangedSubview(psRatio)
        
        statisticsContainer.addArrangedSubview(feeRevenueHeader)
        statisticsContainer.addArrangedSubview(feeRevenueStack)
        statisticsContainer.addArrangedSubview(pfpsRatioHeader)
        statisticsContainer.addArrangedSubview(pfpsRatioStack)
        
        addSubview(statisticsContainer)
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            statisticsContainer.topAnchor.constraint(equalTo: topAnchor),
            statisticsContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            statisticsContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            statisticsContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
