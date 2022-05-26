//
//  GameTimerFactory.swift
//  PlayerTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  Set GameTimer Controller Factory

import Foundation
import UIKit

struct GameTimerControllerFactory {
    static func create() -> GameTimerViewController {
        let router = GameTimerRouter()
        let presenter = GameTimerPresenter()
        let interactor = GameTimerInteractor(presenter: presenter)
        let controller = GameTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: controller)
        return controller
    }
}

