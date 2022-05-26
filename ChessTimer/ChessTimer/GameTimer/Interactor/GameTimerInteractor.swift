//
//  GameTimerInteractor.swift
//  PlayerTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  Bussiness Logic for GameTimerViewController

import Foundation

protocol GameTimerInteractorProtocol {
    /// Validate User Entered Time
    /// - Parameters:
    /// - time: User Value Entered in String
    func validateTime(time: String?)
}

final class GameTimerInteractor: GameTimerInteractorProtocol {
    
    // MARK: Private properties
    private let presenter: DisplayGameTimerDetailsPresenterProtocol
    
    // MARK: Lifecycle
    init(presenter: DisplayGameTimerDetailsPresenterProtocol) {
        self.presenter = presenter
    }
    
    func validateTime(time: String?) {
        //Minimum Game Time should be more than 0
        if Int(time ?? "0") ?? 0 <= GameTimer.minimumGameTime {
            presenter.validationMessage(message: LocalizedMessages.minimumTime.localized())
        }
        //Minimum Game Time should be less than 120
        else if Int(time ?? "0") ?? 0 > GameTimer.maximumGameTime{
            presenter.validationMessage(message: LocalizedMessages.maximumTime.localized())
        }
        //Data Entered is Fine
        else {
            presenter.validationMessage(message: "")
            presenter.routeToShowPlayerTimerViewController()
        }
    }
}
