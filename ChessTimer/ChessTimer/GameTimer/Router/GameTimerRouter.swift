//
//  GameTimerRouter.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  GameTimerViewController Rputer which handles all navigation

import Foundation

protocol GameTimerRouterProtocol: AnyObject {
    /// Route to Player View Controller
    /// - Parameters:
    /// - viewController: ViewController from which we need to navigate
    /// - gameTimer: Total Game Time Set By the User
    func routeToShowPlayerTimerViewController(viewController:GameTimerViewController?,
                                              gameTimer: Int)
}

class GameTimerRouter: GameTimerRouterProtocol {
    
    func routeToShowPlayerTimerViewController(viewController:GameTimerViewController?,
                                              gameTimer: Int) {
        let controller = ShowPlayerTimerFactory.create()
        controller.gameTotalTime = gameTimer// in seconds
        viewController?.navigationController?.pushViewController(controller, animated: true)
        controller.navigationController?.navigationItem.hidesBackButton = true
        controller.navigationItem.setHidesBackButton(true, animated: true)
    }
}
