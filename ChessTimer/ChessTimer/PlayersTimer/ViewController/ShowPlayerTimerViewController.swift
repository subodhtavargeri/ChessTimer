//
//  ShowPlayerTimerViewController.swift
//  ShowPlayerTimerViewController
//
//  Created by Subodh Tavargeri on 20/05/22.
//

import UIKit

protocol ShowPlayerTimerViewControllerDisplayProtocol: AnyObject {
    /// Display First Player Timer
    /// - Parameters:
    /// - playerFirstTimer: First  Player Timer
    func displayPlayerOneTimer(playerFirstTimer: String?)
    /// Display Second Player Timer
    /// - Parameters:
    /// - playerSecondTimer: Second  Player Timer
    func displayPlayerSecondTimer(playerSecondTimer: String?)
    /// Display First Player Won Message
    /// - Parameters:
    /// - message: First Player Message
    func displayPlayerOneWon(message: String?)
    /// Display First Player Lost Message
    /// - Parameters:
    /// - message: First Player Message
    func displayPlayerOneLost(message: String?)
    /// Display Second Player Won Message
    /// - Parameters:
    /// - message: Second Player Message
    func displayPlayerSecondWon(message: String?)
    /// Display First Player Lost Message
    /// - Parameters:
    /// - message: First Player Message
    func displayPlayerSecondLost(message: String?)
    /// Update Button Icon as per status
    /// - Parameters:
    /// - titleText: Button Title
    ///  - imageIcon:  Button status Image
    func updateButtonTitle(titleText:String?, imageIcon: UIImage)
}
class ShowPlayerTimerViewController: UIViewController {
    
    let interactor: ShowPlayerTimerInteractorProtocol?
    private let router: ShowPlayerTimerRouterProtocol?
    var gameTotalTime: Int = 0
    var gameTimeInMintues: Int = 0
    @IBOutlet weak var gameInformationLabel: UILabel!
    @IBOutlet weak var playerTimerStackView: UIStackView!
    @IBOutlet weak var playerOneTimerLabel: UILabel!
    @IBOutlet weak var playerOneUIView: UIView!
    @IBOutlet weak var playerTwoUIView: UIView!
    @IBOutlet weak var buttonTitle: UIButton!
    @IBOutlet weak var playerTwoTimerLabel: UILabel!
    @IBOutlet var popupView: UIView!
    @IBOutlet var blurView: UIVisualEffectView!
    // MARK: Lifecycle
    required init(interactor: ShowPlayerTimerInteractorProtocol,
                  router: ShowPlayerTimerRouterProtocol) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTapGestures()
        interactor?.setGameTimer(setTimer: gameTotalTime)
        setUpUI()
        gameTimeInMintues = gameTotalTime/60 // get in mintues
    }
    func setUpUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "cross")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(closeButtonClicked))
        title = "Player Time"
        blurView.bounds = self.view.bounds
        popupView.bounds = CGRect(x: 0, y: 0, width: self.view.bounds.width*0.9, height: self.view.bounds.height*0.4)
        popupView.layer.cornerRadius = 5
        
        // Create the info button
        let infoButton = UIButton(type: .infoLight)
        
        // You will need to configure the target action for the button itself, not the bar button itemr
        infoButton.addTarget(self, action: #selector(getInfoAction), for: .touchUpInside)
        
        // Create a bar button item using the info button as its custom view
        let infoBarButtonItem = UIBarButtonItem(customView: infoButton)
        
        // Use it as required
        navigationItem.rightBarButtonItem = infoBarButtonItem
    }
    @objc func getInfoAction() {
        gameInformationLabel.text = String(format:LocalizedMessages.gameInformation.localized(),gameTimeInMintues)
        animateScaleIn(desiredView: blurView)
        animateScaleIn(desiredView: popupView)
    }
    @objc func closeButtonClicked() {
        let alert = UIAlertController(title: "Alert", message: LocalizedMessages.closeScreen,preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Yes",
                                      style: UIAlertAction.Style.default,
                                      handler: { [self](_: UIAlertAction!) in
            self.interactor?.resetTimer(setTimer: self.gameTotalTime)
            router?.routeToShowPlayerTimerViewController(viewController: self)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func buttonStartPressed(_ sender: Any) {
        interactor?.setGameState()
    }
    @IBAction func doneAction(_ sender: Any) {
        animateScaleOut(desiredView: popupView)
        animateScaleOut(desiredView: blurView)
    }
    
    @IBAction func resetButtonClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Alert", message: LocalizedMessages.resetTimer,preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Yes",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
            self.interactor?.resetTimer(setTimer: self.gameTotalTime)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    private func setTapGestures() {
        // Initialize Tap Gesture Recognizer
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapView(_:)))
        // Add Tap Gesture Recognizer
        playerOneUIView.addGestureRecognizer(tapGestureRecognizer)
        
        // Initialize Tap Gesture Recognizer
        let tapGestureRecognizerTwo = UITapGestureRecognizer(target: self, action: #selector(didTapViewTwo(_:)))
        // Add Tap Gesture Recognizer
        playerTwoUIView.addGestureRecognizer(tapGestureRecognizerTwo)
    }
    
    // MARK: - Actions
    @objc func didTapView(_ sender: UITapGestureRecognizer) {
        interactor?.playerOneGameState()
    }
    @objc func didTapViewTwo(_ sender: UITapGestureRecognizer) {
        interactor?.playerSecondGameState()
    }
    
    /// Animates a view to scale in and display
    func animateScaleIn(desiredView: UIView) {
        let backgroundView = self.view!
        backgroundView.addSubview(desiredView)
        desiredView.center = backgroundView.center
        desiredView.isHidden = false
        
        desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        desiredView.alpha = 0
        
        UIView.animate(withDuration: 0.2) {
            desiredView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            desiredView.alpha = 1
            //            desiredView.transform = CGAffineTransform.identity
        }
    }
    
    /// Animates a view to scale out remove from the display
    func animateScaleOut(desiredView: UIView) {
        UIView.animate(withDuration: 0.2, animations: {
            desiredView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            desiredView.alpha = 0
        }, completion: { (success: Bool) in
            desiredView.removeFromSuperview()
        })
        
        UIView.animate(withDuration: 0.2, animations: {
            
        }, completion: { _ in
            
        })
    }
}

extension ShowPlayerTimerViewController: ShowPlayerTimerViewControllerDisplayProtocol {
    func displayPlayerOneTimer(playerFirstTimer:String?) {
        playerOneTimerLabel.text = playerFirstTimer
    }
    func displayPlayerSecondTimer(playerSecondTimer: String?) {
        playerTwoTimerLabel.text = playerSecondTimer
    }
    func displayPlayerOneWon(message: String?) {
        playerOneTimerLabel.textColor = ColorConstants.greenHighlighted
        playerOneTimerLabel.text = message
    }
    func displayPlayerOneLost(message: String?) {
        playerOneTimerLabel.textColor = ColorConstants.redError
        playerOneTimerLabel.text = message
    }
    func displayPlayerSecondWon(message: String?) {
        playerTwoTimerLabel.textColor = ColorConstants.greenHighlighted
        playerTwoTimerLabel.text = message
    }
    func displayPlayerSecondLost(message: String?) {
        playerTwoTimerLabel.textColor = ColorConstants.redError
        playerTwoTimerLabel.text = message
    }
    func updateButtonTitle(titleText:String?, imageIcon: UIImage) {
        buttonTitle.setImage(imageIcon, for: .normal)
    }
}
