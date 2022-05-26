//
//  CommonUtilityTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 26/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class CommonUtilityTests: XCTestCase {
    func test_convertIntoMinutesAndSecond() {
        let timer = CommonUtility.convertIntoMinutesAndSecond(timer: 3)
        XCTAssertEqual(timer, "00:03")
    }
    
}
