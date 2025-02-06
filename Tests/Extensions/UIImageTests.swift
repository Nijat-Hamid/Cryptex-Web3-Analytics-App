//
//  UIImageTests.swift
//  Cryptex
//
//  Created by Nijat Hamid on 2/5/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Testing
import UIKit

@Suite("UIImage tests")
struct UIImageTests {
    @Test
    func resizedImage() async throws {
        
        let originalImage = UIGraphicsImageRenderer(size: CGSize(width: 100, height: 100)).image { context in
            UIColor.red.setFill()
            context.fill(CGRect(x: 0, y: 0, width: 100, height: 100))
        }
        
        let targetSize = CGSize(width: 50, height: 50)
        let resizedImage = originalImage.resizedImage(Size: targetSize)
        
        #expect(resizedImage != nil)
        #expect(resizedImage?.size == targetSize)
    }
}
