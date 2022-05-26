//
//  GameTimerRouterStub.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerRouterSpy: GameTimerRouterProtocol {

    var invokedRouteToShowPlayerTimerViewController = false
    var invokedRouteToShowPlayerTimerViewControllerCount = 0
    var invokedRouteToShowPlayerTimerViewControllerParameters: (viewController: GameTimerViewController?, gameTimer: Int)?
    var invokedRouteToShowPlayerTimerViewControllerParametersList = [(viewController: GameTimerViewController?, gameTimer: Int)]()

    func routeToShowPlayerTimerViewController(viewController:GameTimerViewController?,
        gameTimer: Int) {
        invokedRouteToShowPlayerTimerViewController = true
        invokedRouteToShowPlayerTimerViewControllerCount += 1
        invokedRouteToShowPlayerTimerViewControllerParameters = (viewController, gameTimer)
        invokedRouteToShowPlayerTimerViewControllerParametersList.append((viewController, gameTimer))
    }
}
