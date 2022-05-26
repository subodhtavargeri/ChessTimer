//
//  GameTimerViewControllerSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerViewControllerSpy: GameTimerViewControllerDisplayProtocol {

    var invokedShowValidationMessage = false
    var invokedShowValidationMessageCount = 0
    var invokedShowValidationMessageParameters: (message: String?, Void)?
    var invokedShowValidationMessageParametersList = [(message: String?, Void)]()

    func showValidationMessage(message: String?) {
        invokedShowValidationMessage = true
        invokedShowValidationMessageCount += 1
        invokedShowValidationMessageParameters = (message, ())
        invokedShowValidationMessageParametersList.append((message, ()))
    }

    var invokedRouteToShowPlayerTimerViewController = false
    var invokedRouteToShowPlayerTimerViewControllerCount = 0

    func routeToShowPlayerTimerViewController() {
        invokedRouteToShowPlayerTimerViewController = true
        invokedRouteToShowPlayerTimerViewControllerCount += 1
    }
}
