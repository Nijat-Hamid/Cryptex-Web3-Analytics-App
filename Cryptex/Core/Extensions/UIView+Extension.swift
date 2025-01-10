//
//  UIView+Extension.swift
//  Cryptex
//
//  Created by Nijat Hamid on 11/29/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

extension UIView {
    func applyCornerRadiusWithShadow(
        cornerRadius: CGFloat = 10,
        shadowColor: UIColor = .black,
        shadowOpacity: Float = 0.4,
        shadowOffset: CGSize = .zero,
        shadowRadius: CGFloat = 2
    ) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
        
        layer.shadowPath = UIBezierPath(
                   roundedRect: bounds,
                   cornerRadius: cornerRadius
               ).cgPath
        
        layer.masksToBounds = false
    }
    
    func poolImageArranger(with views: [UIImageView], isSingle: Bool, height: CGFloat = 50, spacing: CGFloat = 20) {
        
        subviews.forEach { $0.removeFromSuperview() }
        constraints.forEach { removeConstraint($0) }
        
        
        guard !views.isEmpty else { return }
        guard let imageOne = views.first else { return }
        
       
        imageOne.isHidden = false
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(imageOne)
        
        var activeConstraints: [NSLayoutConstraint] = [
            heightAnchor.constraint(equalToConstant: height)
        ]
        
        if isSingle {
            views.dropFirst().forEach { $0.isHidden = true }
            
            activeConstraints.append(
                imageOne.centerXAnchor.constraint(equalTo: centerXAnchor)
            )
        } else {
            guard views.count > 1, let imageTwo = views[safe: 1] else {
                activeConstraints.append(
                    imageOne.centerXAnchor.constraint(equalTo: centerXAnchor)
                )
                NSLayoutConstraint.activate(activeConstraints)
                return
            }
            
            imageTwo.isHidden = false
            imageTwo.translatesAutoresizingMaskIntoConstraints = false
            addSubview(imageTwo)
            
            activeConstraints.append(contentsOf: [
                imageOne.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -spacing),
                imageTwo.centerXAnchor.constraint(equalTo: centerXAnchor, constant: spacing)
            ])
            
            views.dropFirst(2).forEach { $0.isHidden = true }
        }
        
        NSLayoutConstraint.activate(activeConstraints)
        
        setNeedsLayout()
        layoutIfNeeded()
    }
}
