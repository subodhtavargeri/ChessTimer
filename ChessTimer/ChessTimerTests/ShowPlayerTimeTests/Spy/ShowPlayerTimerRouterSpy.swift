//
//  ShowPlayerTimerRouterSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerRouterSpy: ShowPlayerTimerRouterProtocol {

    var invokedRouteToShowPlayerTimerViewController = false
    var invokedRouteToShowPlayerTimerViewControllerCount = 0
    var invokedRouteToShowPlayerTimerViewControllerParameters: (viewController: ShowPlayerTimerViewController?, Void)?
    var invokedRouteToShowPlayerTimerViewControllerParametersList = [(viewController: ShowPlayerTimerViewController?, Void)]()

    func routeToShowPlayerTimerViewController(viewController:ShowPlayerTimerViewController?) {
        invokedRouteToShowPlayerTimerViewController = true
        invokedRouteToShowPlayerTimerViewControllerCount += 1
        invokedRouteToShowPlayerTimerViewControllerParameters = (viewController, ())
        invokedRouteToShowPlayerTimerViewControllerParametersList.append((viewController, ()))
    }
}
