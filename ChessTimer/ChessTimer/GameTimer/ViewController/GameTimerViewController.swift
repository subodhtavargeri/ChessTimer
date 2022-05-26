//
//  GameTimerViewController.swift
//  PlayerTimer
//
//  Created by Subodh Tavargeri on 17/05/22.
//  Controller to take input from user to set Total Time of the Game

import UIKit

protocol GameTimerViewControllerDisplayProtocol: AnyObject {
    /// Display  Validation Message below Texfield
    /// - Parameter message: InValid Validation Message
    func showValidationMessage(message: String?)
    /// Navigate to Player Timer controller after
    /// - Parameter message: Show  Validation Message
    func routeToShowPlayerTimerViewController()
}
class GameTimerViewController: UIViewController {
    
    @IBOutlet weak var gameTimerTextField: CustomUITextFieldExtension!
    
    @IBOutlet weak var popupUIView: UIView!
    // MARK: Private properties
    let interactor: GameTimerInteractorProtocol?
    private let router: GameTimerRouterProtocol?
    
    // MARK: Lifecycle
    required init(interactor: GameTimerInteractorProtocol?,
                  router: GameTimerRouterProtocol?) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    //Setup Initial UI
    func setup() {
        gameTimerTextField.showtoolbar()
        gameTimerTextField.customUITextFieldDelegate = self
    }
    @IBAction func doneButtonPressed(_ sender: Any) {
        gameTimerTextField.customUITextFieldDelegate?.didEndEditing(textField: gameTimerTextField)
    }
}

extension GameTimerViewController: GameTimerViewControllerDisplayProtocol {
    func showValidationMessage(message: String?) {
        gameTimerTextField.validationViewMessage(message: message ?? "", messageTextColor: ColorConstants.redError)
    }
    
    func routeToShowPlayerTimerViewController() {
        if let timer = gameTimerTextField.text {
            let timerInSeconds = (Int(timer) ?? 0) * 60
            router?.routeToShowPlayerTimerViewController(viewController: self, gameTimer:timerInSeconds)
        }
    }
}
