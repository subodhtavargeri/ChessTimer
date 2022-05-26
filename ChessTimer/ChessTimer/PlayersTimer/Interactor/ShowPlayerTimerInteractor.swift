//
//  ShowPlayerTimerInteractor.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//  Bussiness Logic for player game timer

import Foundation

protocol ShowPlayerTimerInteractorProtocol {
    /// Set Total Time Avaliable for Player First
    /// - Parameters:
    /// - setTimer: Total avaliable Time
    func setPlayerOneTimer(setTimer:Int)
    /// Set Total Time Avaliable for Player Second
    /// - Parameters:
    /// - setTimer: Total avaliable Time
    func setPlayerSecondTimer(setTimer:Int)
    /// Set Total Game Timer for Player One and Player Second
    /// - Parameters:
    /// - setTimer: Total avaliable Time
    func setGameTimer(setTimer:Int)
    /// Set Player One Game Next State
    func playerOneGameState()
    /// Set Player Second Game Next State
    func playerSecondGameState()
    /// Set Game State i.e start, pause, resume
    func setGameState()
    /// Reset Enitre Game Timer
    /// - Parameters:
    /// - setTimer: Reset Player Timer again to which user has entered
    func resetTimer(setTimer:Int)
}

final class ShowPlayerTimerInteractor: ShowPlayerTimerInteractorProtocol {
    // MARK: Private properties
    private let presenter: DisplayShowPlayerTimerPresenterProtocol?
    private var firstPlayerState:PlayerState = .start
    private var secondPlayerState:PlayerState = .start
    private var playerOneTimer: Timer?
    private var playerTwoTimer: Timer?
    private var currentPlayer:CurrentPlayer = .playerOne
    private(set) var playerOneTimerCounter = 0 {
        didSet {
            self.presenter?.showPlayerFirstTimer(firstPlayerTimer:  CommonUtility.convertIntoMinutesAndSecond(timer: self.playerOneTimerCounter))
        }
    }
    
    private(set) var playerTwoTimerCounter = 0 {
        didSet {
            self.presenter?.showPlayerSecondTimer(secondPlayerTimer: CommonUtility.convertIntoMinutesAndSecond(timer: self.playerTwoTimerCounter))
        }
    }
    
    var gameState:GameState = .pause
    //
    // MARK: Lifecycle
    init(presenter: DisplayShowPlayerTimerPresenterProtocol?) {
        self.presenter = presenter
    }
    
    //Set Current Game State
    func setGameState() {
        gameState = gameState == .start ? .pause : .start // Game State Pause/ Start
        self.presenter?.setButtonTitle(title: gameState)
        // If game is in start mode, then update the game state
        if(gameState == .start) {
            // update game state for PlayerOne
            if currentPlayer == .playerOne {
                firstPlayerState = .resume
                playerOneGameState()
            }
            // update game state for PlayerTwo
            else if currentPlayer == .playerTwo {
                secondPlayerState = .resume
                playerSecondGameState()
            }
        }
        else {
            //Stop First and Second player
            playerOneStop()
            playerTwoStop()
        }
    }
    func setGameTimer(setTimer:Int) {
        playerOneTimerCounter = setTimer
        playerTwoTimerCounter = setTimer
    }
    func resetTimer(setTimer:Int) {
        gameState = .start
        playerOneTimerCounter = setTimer
        playerTwoTimerCounter = setTimer
        setGameState()
        currentPlayer = .playerOne
    }
    // MARK: Player One Timer and State Update
    @objc func runPlayerOneTimer() {
        if (self.playerOneTimerCounter == 0) {
            firstPlayerState = .loose
            playerOneGameState()
        }
        else {
            self.playerOneTimerCounter -= 1
        }
    }
    func setPlayerOneTimer(setTimer:Int) {
        playerOneTimerCounter = setTimer
    }
    func startPlayerOne() {
        //Before starting First Player Time, stop the earlier One
        playerOneStop()
        playerOneTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runPlayerOneTimer), userInfo: nil, repeats: true)
    }
    func playerOneLoose() {
        //As soon Playher One looses stop timer, and update Message for player one and Two
        playerOneStop()
        presenter?.playerOneLost(message: String(format: LocalizedMessages.playerLost.localized(), 1))
        presenter?.playerSecondWon(message: String(format: LocalizedMessages.playerWon.localized(), 2))
    }
    func playerOneStop() {
        playerOneTimer?.invalidate()
        playerOneTimer = nil
    }
    func playerOneResume() {
        setPlayerOneTimer(setTimer: playerOneTimerCounter)
        startPlayerOne()
    }
    func playerOneGameState() {
        if gameState == .start {
            switch firstPlayerState {
            case .start:
                firstPlayerState = .stop
                startPlayerOne()
                playerTwoStop()
                currentPlayer = .playerOne
                secondPlayerState = .stop
            case .stop:
                if currentPlayer == .playerOne { // Before doing action verify if Current Player is First Player
                    playerOneStop()
                    playerTwoResume()
                    firstPlayerState = .resume
                    currentPlayer = .playerTwo
                    secondPlayerState = .stop
                }
            case .resume:
                if currentPlayer == .playerOne {
                    playerOneResume()
                    playerTwoStop()
                    firstPlayerState = .stop
                    secondPlayerState = .resume
                }
            case .win:
                print("1 win player")
            case .loose:
                playerOneLoose()
                playerTwoStop()
            }
        }
    }
    // MARK: Player Two Timer and State Update
    func setPlayerSecondTimer(setTimer:Int) {
        playerTwoTimerCounter = setTimer
    }
    func startPlayerTwo() {
        //Before starting Second Player Time, stop the earlier timer
        playerTwoStop()
        playerTwoTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runPlayerTwoTimer), userInfo: nil, repeats: true)
    }
    @objc func runPlayerTwoTimer() {
        if (self.playerTwoTimerCounter == 0) {
            secondPlayerState = .loose
            playerSecondGameState()
        }
        else {
            self.playerTwoTimerCounter -= 1
        }
    }
    func playerTwoStop() {
        playerTwoTimer?.invalidate()
        playerTwoTimer = nil
    }
    func playerTwoResume() {
        setPlayerTwoTimer(setTimer: playerTwoTimerCounter)
        startPlayerTwo()
    }
    func setPlayerTwoTimer(setTimer:Int) {
        playerTwoTimerCounter = setTimer
    }
    func playerTwoLost() {
        playerTwoStop()
        presenter?.playerSecondLost(message: String(format: LocalizedMessages.playerLost.localized(), 2))
        presenter?.playerOneWon(message: String(format: LocalizedMessages.playerWon.localized(), 1))
    }
    func playerSecondGameState() {
        if gameState == .start {
            switch secondPlayerState {
            case .start:
                if currentPlayer == .playerTwo {
                    playerTwoResume()
                    playerOneStop()
                    secondPlayerState = .stop
                }
            case .stop:
                if currentPlayer == .playerTwo {
                    playerTwoStop()
                    playerOneResume()
                    secondPlayerState = .resume
                    currentPlayer = .playerOne
                    firstPlayerState = .stop
                }
            case .resume:
                if currentPlayer == .playerTwo {
                    playerTwoResume()
                    playerOneStop()
                    secondPlayerState = .stop
                    firstPlayerState = .stop
                }
            case .win:
                print("2 win player")
            case .loose:
                playerTwoLost()
                playerOneStop()
            }
        }
    }
}
