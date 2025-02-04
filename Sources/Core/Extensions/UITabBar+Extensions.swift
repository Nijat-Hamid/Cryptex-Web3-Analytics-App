//
//  UITabBar+Extensions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 12/24/24.
//  Copyright © 2024 Nijat Hamid. All rights reserved.
//

import UIKit

extension UITabBarController {
    func setTabBar(hidden: Bool, duration: TimeInterval = 0.4) {
        let animation = Transitions.fade(duration: duration)
        
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseInOut) { [weak self] in
            guard let self,
                  let frame = tabBarController?.tabBar.frame
            else {return}
            
            let factor: CGFloat = hidden ? 1 : -1
            let y = frame.origin.y + (frame.size.height * factor)
            
            tabBar.frame = CGRect(x: frame.origin.x, y: y, width: frame.width, height: frame.height)
        } completion: { [weak self] _ in
            guard let self else {return}
            tabBar.isHidden = hidden
            tabBar.layer.add(animation, forKey: "fadeAnimation")
        }
    }
}
