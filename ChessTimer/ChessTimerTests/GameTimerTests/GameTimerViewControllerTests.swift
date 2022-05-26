//
//  GameTimerViewControllerTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 23/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class GameTimerViewControllerTests: XCTestCase {
    func testSetup() {
        let router = GameTimerRouter()
        let presenter = GameTimerPresenter()
        let interactor = GameTimerInteractor(presenter: presenter)
        let sut = GameTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: sut)
        _ = sut.view // Triggers load view
        sut.viewDidLoad()
        XCTAssertNotNil(sut.gameTimerTextField.delegate)
    }
    
    func test_gameTextFieldDidEnd() {
        let router = GameTimerRouter()
        let presenter = GameTimerPresenter()
        let interactor = GameTimerInteractor(presenter: presenter)
        let sut = GameTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: sut)
        _ = sut.view // Triggers load view
        sut.gameTimerTextField.text = "121233"
        sut.gameTimerTextField.textFieldDidEndEditing(sut.gameTimerTextField)
        XCTAssertEqual(sut.gameTimerTextField.messageLabelText.text, LocalizedMessages.maximumTime.localized())
        
    }
}
