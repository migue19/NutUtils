//
//  NutUtilsTests.swift
//  NutUtilsTests
//
//  Created by Miguel Mexicano Herrera on 21/07/21.
//

import XCTest
@testable import NutUtils

class NutUtilsTests: XCTestCase {
    func testOptionalString() {
        let prueba: String? = nil
        let value = prueba.valueOrEmpty
        XCTAssertNotNil(value)
    }
    func testOptionalData() {
        let prueba: Data? = nil
        let value = prueba.valueOrEmpty
        XCTAssertNotNil(value)
    }
    func testOptionalInt() {
        let prueba: Int? = nil
        let value = prueba.valueOrZero
        XCTAssertNotNil(value)
    }
    func testOptionalDate() {
        let prueba: Date? = nil
        let value = prueba.valueOrCurrent
        XCTAssertNotNil(value)
    }
}
