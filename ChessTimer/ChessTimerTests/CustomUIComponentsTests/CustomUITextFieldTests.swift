//
//  CustomUITextFieldTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 26/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest
class CustomUITextFieldTests: XCTestCase {
    
    func test_setupTextFieldUI() {
        let sut = CustomUITextField()
        sut.setupUI()
        XCTAssertTrue(sut.subviews.count > 0)
    }
}
