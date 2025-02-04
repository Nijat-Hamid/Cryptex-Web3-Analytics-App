//
//  Transitions.swift
//  Cryptex
//
//  Created by Nijat Hamid on 1/15/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//
import UIKit
struct Transitions {
    static func fade(duration: TimeInterval = 0.4, timing:CAMediaTimingFunctionName = .easeInEaseOut) -> CATransition {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = duration
        transition.timingFunction = CAMediaTimingFunction(name: timing)
        return transition
    }
}
