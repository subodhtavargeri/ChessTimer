//
//  PlayerModelTimer.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//

import Foundation

// MARK: - PlayerModelTimer
struct PlayerModelTimer: Equatable {
    let accountID: String
    let accountName: String
}

enum PlayerState {
    case start, stop, resume, win , loose
}
enum GameState {
    case start, pause, reset
}

enum CurrentPlayer {
    case playerOne, playerTwo
}
