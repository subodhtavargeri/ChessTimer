//
//  ShowPlayerTimerPresenter.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//

import Foundation
import UIKit

protocol DisplayShowPlayerTimerPresenterProtocol {
    /// Display Player One Timer
    /// - Parameters:
    /// - firstPlayerTimer: Total avaliable Time
    func showPlayerFirstTimer(firstPlayerTimer:String?)
    /// When First Player Looses
    /// - Parameters:
    /// - message: Display Message on UI
    func playerOneLost(message:String?)
    /// When First Player Wins
    /// - Parameters:
    /// - message: Display Message on UI
    func playerOneWon(message:String?)
    /// Display Player Two Timer
    /// - Parameters:
    /// - secondPlayerTimer: Total avaliable Time
    func showPlayerSecondTimer(secondPlayerTimer:String?)
    /// When Second Player Looses
    /// - Parameters:
    /// - message: Display Message on UI
    func playerSecondLost(message:String?)
    /// When Second Player Wins
    /// - Parameters:
    /// - message: Display Message on UI
    func playerSecondWon(message:String?)
    /// Set Button Image based on game state
    /// - Parameters:
    /// - title:  Set GameState start,pause
    func setButtonTitle(title:GameState)
}
final class ShowPlayerTimerPresenter: DisplayShowPlayerTimerPresenterProtocol {
    
    private weak var controller: ShowPlayerTimerViewControllerDisplayProtocol?
    
    // MARK: Internal methods
    func setup(with controller: ShowPlayerTimerViewControllerDisplayProtocol?) {
        self.controller = controller
    }
    
    func showPlayerFirstTimer(firstPlayerTimer:String?) {
        controller?.displayPlayerOneTimer(playerFirstTimer: firstPlayerTimer)
    }
    func playerOneLost(message:String?) {
        controller?.displayPlayerOneLost(message: message)
    }
    func playerOneWon(message:String?) {
        controller?.displayPlayerOneWon(message: message)
    }
    func playerSecondLost(message:String?) {
        controller?.displayPlayerSecondLost(message: message)
    }
    func playerSecondWon(message:String?) {
        controller?.displayPlayerSecondWon(message: message)
    }
    func showPlayerSecondTimer(secondPlayerTimer:String?) {
        controller?.displayPlayerSecondTimer(playerSecondTimer: secondPlayerTimer)
    }
    func setButtonTitle(title:GameState) {
        let message = title == .start ? "Pause": "Start"
        let imageIcon = message == "Pause" ? UIImage(named: "pauseIcon") :  UIImage(named: "playIcon")
        controller?.updateButtonTitle(titleText: message, imageIcon: (imageIcon ?? UIImage(named: "pauseIcon"))!)
    }
}
