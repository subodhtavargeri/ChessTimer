//
//  CommonUtility.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 20/05/22.
//  Create all Commont Functions that can be used in various classes

import Foundation

// MARK: - Reusable Methods
class CommonUtility {
    /// Convert Timer received in Mintues and Second
    /// - Parameter timer: Received timer in Int
    /// - Returns : String in format: Min:Sec
    static func convertIntoMinutesAndSecond(timer:Int) -> String {
        let minutes = Int(timer) / 60 % 60
        let seconds = Int(timer) % 60
        return String(format: "%02i:%02i",minutes,seconds)
    }
}
