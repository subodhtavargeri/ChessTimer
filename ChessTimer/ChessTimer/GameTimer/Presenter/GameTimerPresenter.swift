//
//  GameTimerPresenter.swift
//  PlayerTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  Handles UI interaction of GameTimerViewController

import Foundation

protocol DisplayGameTimerDetailsPresenterProtocol {
    /// Input Validation Message
    /// - Parameters:
    /// - viewController: ViewController from which we need to navigate
    /// - gameTimer: Total Game Time Set By the User
    func validationMessage(message: String?)
    //Route to Timer ViewController
    func routeToShowPlayerTimerViewController()
}
final class GameTimerPresenter: DisplayGameTimerDetailsPresenterProtocol {
    private weak var controller: GameTimerViewControllerDisplayProtocol?
    
    // MARK: Internal methods
    func setup(with controller: GameTimerViewControllerDisplayProtocol?) {
        self.controller = controller
    }
    
    func validationMessage(message: String?) {
        controller?.showValidationMessage(message: message)
    }
    
    func routeToShowPlayerTimerViewController() {
        controller?.routeToShowPlayerTimerViewController()
    }
}
