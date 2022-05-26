//
//  ShowPlayerTimerInteractorTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerInteractorTests: XCTestCase {
    func test_SetPlayerOneTimer() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.setPlayerOneTimer(setTimer: 2)
        XCTAssertEqual(sut.playerOneTimerCounter, 2)
    }
    func test_SetPlayerTwoTimer() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.setPlayerTwoTimer(setTimer: 3)
        XCTAssertEqual(sut.playerTwoTimerCounter, 3)
    }
    func test_SetGameTimer() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.setGameTimer(setTimer: 2)
        XCTAssertEqual(sut.playerTwoTimerCounter, 2)
        XCTAssertEqual(sut.playerOneTimerCounter, 2)
    }
    func test_setGameState() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.gameState = .pause
        sut.setGameState()
        XCTAssertTrue(presenter.invokedSetButtonTitle)
    }
    func test_resetTimer() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.gameState = .pause
        sut.resetTimer(setTimer: 2)
        XCTAssertEqual(sut.playerOneTimerCounter, 2)
    }
    func test_RunPlayerOneTimer() {
        let presenter = ShowPlayerTimerPresenterSpy()
        let sut = ShowPlayerTimerInteractor.init(presenter: presenter)
        sut.setPlayerOneTimer(setTimer: 0)
        sut.gameState = .start
        sut.runPlayerOneTimer()
        XCTAssertNotNil(sut.playerOneTimerCounter)
    }
}
