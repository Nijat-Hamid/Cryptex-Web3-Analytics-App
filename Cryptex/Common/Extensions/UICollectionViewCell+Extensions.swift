//
//  UICollectionViewCell+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/12/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

extension UICollectionViewCell {
    func setupCornerRadiusWithShadow(
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
        layer.masksToBounds = false

//        contentView.layer.cornerRadius = cornerRadius
        contentView.layer.masksToBounds = false
    }
}
