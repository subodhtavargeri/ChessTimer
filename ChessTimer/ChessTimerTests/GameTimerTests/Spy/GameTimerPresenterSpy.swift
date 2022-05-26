//
//  GameTimerPresenterSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerPresenterSpy: DisplayGameTimerDetailsPresenterProtocol {

    var invokedValidationMessage = false
    var invokedValidationMessageCount = 0
    var invokedValidationMessageParameters: (message: String?, Void)?
    var invokedValidationMessageParametersList = [(message: String?, Void)]()

    func validationMessage(message: String?) {
        invokedValidationMessage = true
        invokedValidationMessageCount += 1
        invokedValidationMessageParameters = (message, ())
        invokedValidationMessageParametersList.append((message, ()))
    }

    var invokedRouteToShowPlayerTimerViewController = false
    var invokedRouteToShowPlayerTimerViewControllerCount = 0

    func routeToShowPlayerTimerViewController() {
        invokedRouteToShowPlayerTimerViewController = true
        invokedRouteToShowPlayerTimerViewControllerCount += 1
    }
}
