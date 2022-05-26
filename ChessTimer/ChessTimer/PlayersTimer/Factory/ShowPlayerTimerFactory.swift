//
//  ShowPlayerTimerFactory.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//

import Foundation
import UIKit

struct ShowPlayerTimerFactory {
    static func create() -> ShowPlayerTimerViewController {
        let router = ShowPlayerTimerRouter()
        let presenter = ShowPlayerTimerPresenter()
        let interactor = ShowPlayerTimerInteractor(presenter: presenter)
        let controller = ShowPlayerTimerViewController(
            interactor: interactor,
            router: router
        )
        presenter.setup(with: controller)
        return controller
    }
}
