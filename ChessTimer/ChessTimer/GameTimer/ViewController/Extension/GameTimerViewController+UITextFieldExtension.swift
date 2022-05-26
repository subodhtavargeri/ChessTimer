//
//  GameTimerViewController+UITextFieldExtension.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  TextField of GameTimerViewController

import Foundation
import UIKit
extension GameTimerViewController: CustomUITextFieldProtocol {
    func didEndEditing(textField: UITextField) {
        interactor?.validateTime(time: textField.text)
    }
}
