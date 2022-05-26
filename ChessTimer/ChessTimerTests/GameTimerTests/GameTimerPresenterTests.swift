//
//  GameTimerPresenterTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerPresenterTests: XCTestCase {
    func test_ValidationMessage() {
        let controller = GameTimerViewControllerSpy()
        let sut = GameTimerPresenter()
        sut.setup(with: controller)
        sut.validationMessage(message: "Invalid timer")
        XCTAssertTrue(controller.invokedShowValidationMessage)
        XCTAssertEqual(controller.invokedShowValidationMessageParameters?.message, "Invalid timer")
    }
    
    func test_RouterToShowPlayerTimerViewController() {
        let controller = GameTimerViewControllerSpy()
        let sut = GameTimerPresenter()
        sut.setup(with: controller)
        sut.routeToShowPlayerTimerViewController()
        XCTAssertTrue(controller.invokedRouteToShowPlayerTimerViewController)
    }
}
