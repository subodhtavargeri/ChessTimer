//
//  GameTimerInteractorTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerInteractorTests: XCTestCase {
    func test_ValidateTime_InvalidTime() {
        let presenter = GameTimerPresenterSpy()
        let sut = GameTimerInteractor(presenter: presenter)
        sut.validateTime(time: "WrongTime")
        XCTAssertTrue(presenter.invokedValidationMessage)
        XCTAssertEqual(presenter.invokedValidationMessageParameters?.message, LocalizedMessages.minimumTime.localized())
    }
    
    func test_ValidateTime_ValidTime() {
        let presenter = GameTimerPresenterSpy()
        let sut = GameTimerInteractor(presenter: presenter)
        sut.validateTime(time: "22")
        XCTAssertTrue(presenter.invokedValidationMessage)
        XCTAssertEqual(presenter.invokedValidationMessageParameters?.message, "")
    }
    
    func test_ValidateTime_MaximumTime_Entered() {
        let presenter = GameTimerPresenterSpy()
        let sut = GameTimerInteractor(presenter: presenter)
        sut.validateTime(time: "121")
        XCTAssertTrue(presenter.invokedValidationMessage)
        XCTAssertEqual(presenter.invokedValidationMessageParameters?.message,LocalizedMessages.maximumTime.localized())
    }
    
    func test_ValidateTime_MinimumTime_Entered() {
        let presenter = GameTimerPresenterSpy()
        let sut = GameTimerInteractor(presenter: presenter)
        sut.validateTime(time: "0")
        XCTAssertTrue(presenter.invokedValidationMessage)
        XCTAssertEqual(presenter.invokedValidationMessageParameters?.message,LocalizedMessages.minimumTime.localized())
    }
}
