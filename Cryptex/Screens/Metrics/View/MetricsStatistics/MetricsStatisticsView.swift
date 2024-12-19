//
//  MetricsStatisticsView.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/17/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

class MetricsStatisticsView: UIView {
    
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
                label.text = "Fee:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "Revenue:"
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
    
    private lazy var primaryStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "$11.35M"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "$0.0"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }()
        ])
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var secondaryHeader:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "P/F Ratio:"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .mutedForeground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "P/S Ratio:"
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
    
    private lazy var secondaryStack:UIStackView = {
        let stack = UIStackView(arrangedSubviews: [
          {
                let label = UILabel()
                label.text = "6.44"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }(),{
                let label = UILabel()
                label.text = "N/A"
                label.translatesAutoresizingMaskIntoConstraints = false
                label.numberOfLines = .zero
                label.textAlignment = .center
                label.font = UIFont(name: "Geist-medium", size: 14)
                label.textColor = .foreground
                return label
                
            }()
        ])
        stack.layer.cornerRadius = 10
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 8
        stack.alignment = .center
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var dataContainer:UIStackView = {
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
    
    private func setupUI(){
        backgroundColor = .cardBackgroundDark
        self.applyCornerRadiusWithShadow()
        dataContainer.addArrangedSubview(primaryHeader)
        dataContainer.addArrangedSubview(primaryStack)
        dataContainer.addArrangedSubview(secondaryHeader)
        dataContainer.addArrangedSubview(secondaryStack)
        addSubview(dataContainer)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataContainer.topAnchor.constraint(equalTo: topAnchor),
            dataContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            dataContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            dataContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
