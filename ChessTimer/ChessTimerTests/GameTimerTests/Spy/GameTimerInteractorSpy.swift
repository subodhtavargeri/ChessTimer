//
//  GameTimerInteractorSpy.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerInteractorSpy: GameTimerInteractorProtocol {

    var invokedValidateTime = false
    var invokedValidateTimeCount = 0
    var invokedValidateTimeParameters: (time: String?, Void)?
    var invokedValidateTimeParametersList = [(time: String?, Void)]()

    func validateTime(time: String?) {
        invokedValidateTime = true
        invokedValidateTimeCount += 1
        invokedValidateTimeParameters = (time, ())
        invokedValidateTimeParametersList.append((time, ()))
    }
}
