//
//  ShowPlayerTimerPresenterTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerPresenterTests: XCTestCase {
    func test_ShowPlayerFirstTimer() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.showPlayerFirstTimer(firstPlayerTimer: "20")
        XCTAssertTrue(controller.invokedDisplayPlayerOneTimer)
    }
    func test_PlayerOneLost() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.playerOneLost(message: "Lost")
        XCTAssertTrue(controller.invokedDisplayPlayerOneLost)
        XCTAssertEqual(controller.invokedDisplayPlayerOneLostParametersList[0].message,"Lost")
    }
    func test_PlayerOneWon() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.playerOneWon(message: "Won")
        XCTAssertTrue(controller.invokedDisplayPlayerOneWon)
        XCTAssertEqual(controller.invokedDisplayPlayerOneWonParametersList[0].message,"Won")
    }
    func test_PlayerSecondLost() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.playerSecondLost(message: "lost")
        XCTAssertTrue(controller.invokedDisplayPlayerSecondLost)
        XCTAssertEqual(controller.invokedDisplayPlayerSecondLostParametersList[0].message,"lost")
    }
    func test_PlayerSecondWon() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.playerSecondWon(message: "Won")
        XCTAssertTrue(controller.invokedDisplayPlayerSecondWon)
        XCTAssertEqual(controller.invokedDisplayPlayerSecondWonParametersList[0].message,"Won")
    }
    func test_ButtonTitle() {
        let sut = ShowPlayerTimerPresenter()
        let controller = ShowPlayerTimerViewControllerSpy()
        sut.setup(with: controller)
        sut.setButtonTitle(title: .start)
        XCTAssertTrue(controller.invokedUpdateButtonTitle)
    }
}
