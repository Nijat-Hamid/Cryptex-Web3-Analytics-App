//
//  TransitionsTests.swift
//  Cryptex
//
//  Created by Nijat Hamid on 2/5/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Testing
@testable import Cryptex
import UIKit

@Suite("Transitions tests")
struct TransitionsTests {
    @Test
    func fadeTransition() async throws {
        let defaultTransition = Transitions.fade()
        
        #expect(defaultTransition.type == .fade)
        #expect(defaultTransition.duration == 0.4)
        #expect(defaultTransition.timingFunction == CAMediaTimingFunction(name:.easeInEaseOut))
    }
}
