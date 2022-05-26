//
//  ShowPlayerTimerPresenterSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerPresenterSpy: DisplayShowPlayerTimerPresenterProtocol {

    var invokedShowPlayerFirstTimer = false
    var invokedShowPlayerFirstTimerCount = 0
    var invokedShowPlayerFirstTimerParameters: (firstPlayerTimer: String?, Void)?
    var invokedShowPlayerFirstTimerParametersList = [(firstPlayerTimer: String?, Void)]()

    func showPlayerFirstTimer(firstPlayerTimer:String?) {
        invokedShowPlayerFirstTimer = true
        invokedShowPlayerFirstTimerCount += 1
        invokedShowPlayerFirstTimerParameters = (firstPlayerTimer, ())
        invokedShowPlayerFirstTimerParametersList.append((firstPlayerTimer, ()))
    }

    var invokedPlayerOneLost = false
    var invokedPlayerOneLostCount = 0
    var invokedPlayerOneLostParameters: (message: String?, Void)?
    var invokedPlayerOneLostParametersList = [(message: String?, Void)]()

    func playerOneLost(message:String?) {
        invokedPlayerOneLost = true
        invokedPlayerOneLostCount += 1
        invokedPlayerOneLostParameters = (message, ())
        invokedPlayerOneLostParametersList.append((message, ()))
    }

    var invokedPlayerOneWon = false
    var invokedPlayerOneWonCount = 0
    var invokedPlayerOneWonParameters: (message: String?, Void)?
    var invokedPlayerOneWonParametersList = [(message: String?, Void)]()

    func playerOneWon(message:String?) {
        invokedPlayerOneWon = true
        invokedPlayerOneWonCount += 1
        invokedPlayerOneWonParameters = (message, ())
        invokedPlayerOneWonParametersList.append((message, ()))
    }

    var invokedShowPlayerSecondTimer = false
    var invokedShowPlayerSecondTimerCount = 0
    var invokedShowPlayerSecondTimerParameters: (secondPlayerTimer: String?, Void)?
    var invokedShowPlayerSecondTimerParametersList = [(secondPlayerTimer: String?, Void)]()

    func showPlayerSecondTimer(secondPlayerTimer:String?) {
        invokedShowPlayerSecondTimer = true
        invokedShowPlayerSecondTimerCount += 1
        invokedShowPlayerSecondTimerParameters = (secondPlayerTimer, ())
        invokedShowPlayerSecondTimerParametersList.append((secondPlayerTimer, ()))
    }

    var invokedPlayerSecondLost = false
    var invokedPlayerSecondLostCount = 0
    var invokedPlayerSecondLostParameters: (message: String?, Void)?
    var invokedPlayerSecondLostParametersList = [(message: String?, Void)]()

    func playerSecondLost(message:String?) {
        invokedPlayerSecondLost = true
        invokedPlayerSecondLostCount += 1
        invokedPlayerSecondLostParameters = (message, ())
        invokedPlayerSecondLostParametersList.append((message, ()))
    }

    var invokedPlayerSecondLWon = false
    var invokedPlayerSecondLWonCount = 0
    var invokedPlayerSecondLWonParameters: (message: String?, Void)?
    var invokedPlayerSecondLWonParametersList = [(message: String?, Void)]()

    func playerSecondWon(message:String?) {
        invokedPlayerSecondLWon = true
        invokedPlayerSecondLWonCount += 1
        invokedPlayerSecondLWonParameters = (message, ())
        invokedPlayerSecondLWonParametersList.append((message, ()))
    }

    var invokedSetButtonTitle = false
    var invokedSetButtonTitleCount = 0
    var invokedSetButtonTitleParameters: (title: GameState, Void)?
    var invokedSetButtonTitleParametersList = [(title: GameState, Void)]()

    func setButtonTitle(title:GameState) {
        invokedSetButtonTitle = true
        invokedSetButtonTitleCount += 1
        invokedSetButtonTitleParameters = (title, ())
        invokedSetButtonTitleParametersList.append((title, ()))
    }
}
