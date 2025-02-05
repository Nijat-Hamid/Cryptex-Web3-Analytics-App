//
//  Tests.swift
//  Tests
//
//  Created by Nijat Hamid on 2/5/25.
//  Copyright © 2025 Nijat Hamid. All rights reserved.
//

import Testing
@testable import Cryptex
import Foundation

@Suite("Formatter tests")
struct FormatterTests {
    
    // MARK: - Currency Tests
    @Suite("Currency Tests")
    struct CurrencyTests {
        @Test
        func regularNumbers() async throws {
            #expect(Formatter.number(1234.56, as: .currency) == "$1.23K")
            #expect(Formatter.number(1000000, as: .currency) == "$1M")
            #expect(Formatter.number(1500000000, as: .currency) == "$1.5B")
            #expect(Formatter.number(2000000000000, as: .currency) == "$2T")
        }
        
        @Test
        func smallNumbers() async throws {
            #expect(Formatter.number(5.99, as: .currency) == "$5.99")
            #expect(Formatter.number(0, as: .currency) == "$0")
            #expect(Formatter.number(0.000001, as: .currency) == "$0")
        }
        
        @Test
        func negativeNumbers() async throws {
            #expect(Formatter.number(-1234.56, as: .currency) == "-$1.23K")
            #expect(Formatter.number(-1000000, as: .currency) == "-$1M")
        }
        
        @Test
        func differentTypes() async throws {
            #expect(Formatter.number(NSNumber(value: 1234.56), as: .currency) == "$1.23K")
            #expect(Formatter.number("1234.56", as: .currency) == "$1.23K")
            #expect(Formatter.number("String", as: .currency) == "N/A")
            #expect(Formatter.number("", as: .currency) == "N/A")
            #expect(Formatter.number(Float(3.45), as: .decimal) == "3.45")
            #expect(Formatter.number(Decimal(5938.9934), as: .decimal) == "5.94K")
            #expect(Formatter.number(Float.infinity, as: .currency) == "N/A")
            #expect(Formatter.number(Float.nan, as: .currency) == "N/A")
            
            #expect(Formatter.number(NSNumber(value: -5678.90), as: .currency) == "-$5.68K")
            #expect(Formatter.number(NSNumber(value: Float.infinity), as: .currency) == "N/A")
            #expect(Formatter.number(NSNumber(value: Float.nan), as: .currency) == "N/A")
        }
        
        @Test
        func edgeCases() async throws {
            #expect(Formatter.number(Double.infinity, as: .currency) == "N/A")
            #expect(Formatter.number(Double.nan, as: .currency) == "N/A")
            #expect(Formatter.number(NSNull(), as: .currency) == "N/A")
            #expect(Formatter.number(["invalid"], as: .currency) == "N/A")
        }
        
        @Test
        func boundaryValues() async throws {
            #expect(Formatter.number(999.99, as: .currency) == "$999.99")
            #expect(Formatter.number(1000, as: .currency) == "$1K")
            #expect(Formatter.number(999994.99, as: .currency) == "$999.99K")
            #expect(Formatter.number(999995, as: .currency) == "$999,995")
            #expect(Formatter.number(1000000, as: .currency) == "$1M")
        }
    }
    
    // MARK: - Percentage Tests
    @Suite("Percentage Tests")
    struct PercentageTests {
        @Test
        func regularPercentages() async throws {
            #expect(Formatter.number(50, as: .percentage) == "50%")
            #expect(Formatter.number(99.99, as: .percentage) == "99.99%")
        }
        
        @Test
        func zeroAndNegative() async throws {
            #expect(Formatter.number(0, as: .percentage) == "0%")
            #expect(Formatter.number(-25.5, as: .percentage) == "-25.5%")
        }
        
        @Test
        func largeNumbers() async throws {
            #expect(Formatter.number(1000, as: .percentage) == "1,000%")
            #expect(Formatter.number(1000.99, as: .percentage) == "1,000.99%")
            #expect(Formatter.number(1000.992837, as: .percentage) == "1,000.99%")
        }
        
        @Test
        func edgeCases() async throws {
            #expect(Formatter.number(Double.infinity, as: .percentage) == "N/A")
            #expect(Formatter.number(Double.nan, as: .percentage) == "N/A")
        }
    }
    
    // MARK: - Decimal Tests
    @Suite("Decimal Tests")
    struct DecimalTests {
        @Test
        func regularNumbers() async throws {
            #expect(Formatter.number(1234.56, as: .decimal) == "1.23K")
            #expect(Formatter.number(12, as: .decimal) == "12")
            #expect(Formatter.number(1000000, as: .decimal) == "1M")
        }
        
        @Test
        func precisionTests() async throws {
            #expect(Formatter.number(1234.5678, as: .decimal) == "1.23K")
            #expect(Formatter.number(1.23456, as: .decimal) == "1.23")
        }
        
        @Test
        func edgeCases() async throws {
            #expect(Formatter.number("invalid", as: .decimal) == "N/A")
            #expect(Formatter.number([1,2,3], as: .decimal) == "N/A")
            #expect(Formatter.number(Double.infinity, as: .decimal) == "N/A")
        }
    }
    
    // MARK: - Absolute Value Tests
    @Suite("Absolute Value Tests")
    struct AbsoluteValueTests {
        @Test
        func absoluteValues() async throws {
            #expect(Formatter.number(-1234.56, as: .currency, absolute: true) == "$1.23K")
            #expect(Formatter.number(-50, as: .percentage, absolute: true) == "50%")
            #expect(Formatter.number(-1000000, as: .decimal, absolute: true) == "1M")
        }
    }
    
    // MARK: - Date Tests
    @Suite("Date Tests")
    struct DateTests {
        let testDate = Date(timeIntervalSince1970: 1706889600) // February 2, 2024
        
        @Test
        func dateStyles() async throws {
            #expect(Formatter.date(testDate, as: .full).contains("2024"))
            #expect(Formatter.date(testDate, as: .long).contains("2024"))
            #expect(Formatter.date(testDate, as: .medium).contains("2024"))
            #expect(Formatter.date(testDate, as: .short).contains("24"))
        }
        
        @Test
        func timeInclusion() async throws {
            #expect(Formatter.date(testDate, as: .full, includeTime: true).contains(":"))
            #expect(Formatter.date(testDate, as: .medium, includeTime: true).contains(":"))
            #expect(Formatter.date(testDate, as: .long, includeTime: true).contains(":"))
            #expect(Formatter.date(testDate, as: .short, includeTime: true).contains(":"))
        }
        
        @Test
        func customFormats() async throws {
            #expect(Formatter.date(testDate, as: .custom("yyyy-MM-dd")) == "2024-02-02")
            #expect(Formatter.date(testDate, as: .monthOnly) == "February 2024")
            #expect(Formatter.date(testDate, as: .yearOnly) == "2024")
        }
        
        @Test
        func timestampHandling() async throws {
            #expect(Formatter.date(Double(1706889600), as: .custom("yyyy-MM-dd")) == "2024-02-02")
            #expect(Formatter.date(Double(1706889600000), as: .custom("yyyy-MM-dd")) == "2024-02-02")
            #expect(Formatter.date(Double(17068), as: .custom("yyyy-MM-dd")) == "1970-01-01")
        }
        
        @Test
        func invalidInputs() async throws {
            #expect(Formatter.date("invalid", as: .full) == "N/A")
            #expect(Formatter.date(["invalid"], as: .full) == "N/A")
            #expect(Formatter.date(NSNull(), as: .full) == "N/A")
        }
    }
}
