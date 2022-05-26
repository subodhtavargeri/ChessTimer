//
//  ShowPlayerTimerViewControllerTests.swift
//  ChessTimerTests
//
//  Created by Subodh Tavargeri on 26/05/22.
//

import Foundation
@testable import ChessTimer
import XCTest

class ShowPlayerTimerViewControllerTests: XCTestCase {
    func test_ViewDidLoad() {
        let router = ShowPlayerTimerRouter()
        let presenter = ShowPlayerTimerPresenter()
        let interactor = ShowPlayerTimerInteractor(presenter: presenter)
        let sut = ShowPlayerTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: sut)
        _ = sut.view // Triggers load view
        sut.viewDidLoad()
        XCTAssertNotNil(sut.playerOneUIView.gestureRecognizers)
    }
    func test_InfoButton() {
        let router = ShowPlayerTimerRouter()
        let presenter = ShowPlayerTimerPresenter()
        let interactor = ShowPlayerTimerInteractor(presenter: presenter)
        let sut = ShowPlayerTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: sut)
        _ = sut.view // Triggers load view
        sut.viewDidLoad()
        sut.getInfoAction()
        XCTAssertEqual(sut.gameInformationLabel.text, String(format:LocalizedMessages.gameInformation.localized(),sut.gameTotalTime/60))
       
    }
}
