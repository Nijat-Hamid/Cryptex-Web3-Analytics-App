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
}
