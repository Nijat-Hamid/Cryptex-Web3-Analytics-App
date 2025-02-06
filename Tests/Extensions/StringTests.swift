//
//  StringTests.swift
//  Cryptex
//
//  Created by Nijat Hamid on 2/6/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Testing
@testable import Cryptex

@Suite("String tests")
struct StringTests {
    @Test
    func truncateMiddle() async throws {
        #expect("Label".truncateMiddle(maxLength: 14) == "Label")
        #expect("OneTwo".truncateMiddle(maxLength: 14) == "OneTwo")
        #expect("OneTwoo".truncateMiddle(maxLength: 14) == "OneTwoo")
        #expect("NijatHamid".truncateMiddle(maxLength: 8) == "Nija...d")
        #expect("".truncateMiddle(maxLength: 8) == "")
        #expect("Hello".truncateMiddle(maxLength: 3) == "Hello")
        #expect("HelloAmazingWorld".truncateMiddle(maxLength: 6) == "Hel...")
        
    }
}
