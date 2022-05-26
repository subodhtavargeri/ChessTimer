//
//  ShowPlayerTimerInteractorSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerInteractorSpy: ShowPlayerTimerInteractorProtocol {

    var invokedSetPlayerOneTimer = false
    var invokedSetPlayerOneTimerCount = 0
    var invokedSetPlayerOneTimerParameters: (setTimer: Int, Void)?
    var invokedSetPlayerOneTimerParametersList = [(setTimer: Int, Void)]()

    func setPlayerOneTimer(setTimer:Int) {
        invokedSetPlayerOneTimer = true
        invokedSetPlayerOneTimerCount += 1
        invokedSetPlayerOneTimerParameters = (setTimer, ())
        invokedSetPlayerOneTimerParametersList.append((setTimer, ()))
    }

    var invokedSetPlayerSecondTimer = false
    var invokedSetPlayerSecondTimerCount = 0
    var invokedSetPlayerSecondTimerParameters: (setTimer: Int, Void)?
    var invokedSetPlayerSecondTimerParametersList = [(setTimer: Int, Void)]()

    func setPlayerSecondTimer(setTimer:Int) {
        invokedSetPlayerSecondTimer = true
        invokedSetPlayerSecondTimerCount += 1
        invokedSetPlayerSecondTimerParameters = (setTimer, ())
        invokedSetPlayerSecondTimerParametersList.append((setTimer, ()))
    }

    var invokedSetGameTimer = false
    var invokedSetGameTimerCount = 0
    var invokedSetGameTimerParameters: (setTimer: Int, Void)?
    var invokedSetGameTimerParametersList = [(setTimer: Int, Void)]()

    func setGameTimer(setTimer:Int) {
        invokedSetGameTimer = true
        invokedSetGameTimerCount += 1
        invokedSetGameTimerParameters = (setTimer, ())
        invokedSetGameTimerParametersList.append((setTimer, ()))
    }

    var invokedPlayerOneGameState = false
    var invokedPlayerOneGameStateCount = 0

    func playerOneGameState() {
        invokedPlayerOneGameState = true
        invokedPlayerOneGameStateCount += 1
    }

    var invokedPlayerSecondGameState = false
    var invokedPlayerSecondGameStateCount = 0

    func playerSecondGameState() {
        invokedPlayerSecondGameState = true
        invokedPlayerSecondGameStateCount += 1
    }

    var invokedSetGameState = false
    var invokedSetGameStateCount = 0

    func setGameState() {
        invokedSetGameState = true
        invokedSetGameStateCount += 1
    }

    var invokedResetTimer = false
    var invokedResetTimerCount = 0
    var invokedResetTimerParameters: (setTimer: Int, Void)?
    var invokedResetTimerParametersList = [(setTimer: Int, Void)]()

    func resetTimer(setTimer:Int) {
        invokedResetTimer = true
        invokedResetTimerCount += 1
        invokedResetTimerParameters = (setTimer, ())
        invokedResetTimerParametersList.append((setTimer, ()))
    }
}
