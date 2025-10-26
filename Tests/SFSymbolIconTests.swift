//
//  SFSymbolIconTests.swift
//  SFSymbolIconTests
//
//  Created by Kaito Kitaya on 26.10.25.
//

import XCTest
@testable import SFSymbolIcon

final class SFSymbolIconTests: XCTestCase {
    
    func testSymbolIconInitialization() throws {
        let symbolIcon = SFSymbolIcon(level: .debug)
        XCTAssertNotNil(symbolIcon)
    }
    
    func testIconSafeWithValidSymbol() throws {
        let symbolIcon = SFSymbolIcon(level: .debug)
        let icon = symbolIcon.IconSafe(systemName: "heart.fill")
        XCTAssertNotNil(icon)
    }
    
    func testIconSafeWithInvalidSymbol() throws {
        let symbolIcon = SFSymbolIcon(level: .debug)
        let icon = symbolIcon.IconSafe(systemName: "nonexistent.symbol")
        XCTAssertNil(icon)
    }
}
