//
//  ShowPlayerTimerViewControllerTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerViewControllerSpy: ShowPlayerTimerViewControllerDisplayProtocol {

    var invokedDisplayPlayerOneTimer = false
    var invokedDisplayPlayerOneTimerCount = 0
    var invokedDisplayPlayerOneTimerParameters: (playerFirstTimer: String?, Void)?
    var invokedDisplayPlayerOneTimerParametersList = [(playerFirstTimer: String?, Void)]()

    func displayPlayerOneTimer(playerFirstTimer: String?) {
        invokedDisplayPlayerOneTimer = true
        invokedDisplayPlayerOneTimerCount += 1
        invokedDisplayPlayerOneTimerParameters = (playerFirstTimer, ())
        invokedDisplayPlayerOneTimerParametersList.append((playerFirstTimer, ()))
    }

    var invokedDisplayPlayerSecondTimer = false
    var invokedDisplayPlayerSecondTimerCount = 0
    var invokedDisplayPlayerSecondTimerParameters: (playerSecondTimer: String?, Void)?
    var invokedDisplayPlayerSecondTimerParametersList = [(playerSecondTimer: String?, Void)]()

    func displayPlayerSecondTimer(playerSecondTimer: String?) {
        invokedDisplayPlayerSecondTimer = true
        invokedDisplayPlayerSecondTimerCount += 1
        invokedDisplayPlayerSecondTimerParameters = (playerSecondTimer, ())
        invokedDisplayPlayerSecondTimerParametersList.append((playerSecondTimer, ()))
    }

    var invokedDisplayPlayerOneWon = false
    var invokedDisplayPlayerOneWonCount = 0
    var invokedDisplayPlayerOneWonParameters: (message: String?, Void)?
    var invokedDisplayPlayerOneWonParametersList = [(message: String?, Void)]()

    func displayPlayerOneWon(message: String?) {
        invokedDisplayPlayerOneWon = true
        invokedDisplayPlayerOneWonCount += 1
        invokedDisplayPlayerOneWonParameters = (message, ())
        invokedDisplayPlayerOneWonParametersList.append((message, ()))
    }

    var invokedDisplayPlayerOneLost = false
    var invokedDisplayPlayerOneLostCount = 0
    var invokedDisplayPlayerOneLostParameters: (message: String?, Void)?
    var invokedDisplayPlayerOneLostParametersList = [(message: String?, Void)]()

    func displayPlayerOneLost(message: String?) {
        invokedDisplayPlayerOneLost = true
        invokedDisplayPlayerOneLostCount += 1
        invokedDisplayPlayerOneLostParameters = (message, ())
        invokedDisplayPlayerOneLostParametersList.append((message, ()))
    }

    var invokedDisplayPlayerSecondWon = false
    var invokedDisplayPlayerSecondWonCount = 0
    var invokedDisplayPlayerSecondWonParameters: (message: String?, Void)?
    var invokedDisplayPlayerSecondWonParametersList = [(message: String?, Void)]()

    func displayPlayerSecondWon(message: String?) {
        invokedDisplayPlayerSecondWon = true
        invokedDisplayPlayerSecondWonCount += 1
        invokedDisplayPlayerSecondWonParameters = (message, ())
        invokedDisplayPlayerSecondWonParametersList.append((message, ()))
    }

    var invokedDisplayPlayerSecondLost = false
    var invokedDisplayPlayerSecondLostCount = 0
    var invokedDisplayPlayerSecondLostParameters: (message: String?, Void)?
    var invokedDisplayPlayerSecondLostParametersList = [(message: String?, Void)]()

    func displayPlayerSecondLost(message: String?) {
        invokedDisplayPlayerSecondLost = true
        invokedDisplayPlayerSecondLostCount += 1
        invokedDisplayPlayerSecondLostParameters = (message, ())
        invokedDisplayPlayerSecondLostParametersList.append((message, ()))
    }

    var invokedUpdateButtonTitle = false
    var invokedUpdateButtonTitleCount = 0
    var invokedUpdateButtonTitleParameters: (titleText: String?, imageIcon: UIImage)?
    var invokedUpdateButtonTitleParametersList = [(titleText: String?, imageIcon: UIImage)]()

    func updateButtonTitle(titleText:String?, imageIcon: UIImage) {
        invokedUpdateButtonTitle = true
        invokedUpdateButtonTitleCount += 1
        invokedUpdateButtonTitleParameters = (titleText, imageIcon)
        invokedUpdateButtonTitleParametersList.append((titleText, imageIcon))
    }
}
