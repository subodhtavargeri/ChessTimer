//
//  CustomUITextFieldExtension.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  CustomTextField componenet Extension

import Foundation
import UIKit
@IBDesignable class CustomUITextFieldExtension: CustomUITextField {

    var messageLabelText = UILabel()
    var messageLabelHeight :CGFloat = 0.0
    var bottomMessageView = UIView ()
    
    @IBInspectable var showBottomView: Bool = false {
        didSet {
            setbottomView()
        }
    }
    func setbottomView() {
        if(!showBottomView) {
            bottomMessageView.isHidden = true
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    override open func layoutSubviews() {
        super.layoutSubviews()
        bottomMessageView.frame = CGRect(x: 0, y: bounds.height + offset, width: bounds.width, height: 18)
    }
    override func setupUI() {
        super.setupUI()
        addSubview(bottomMessageView)
        bottomMessageView.addSubview(messageLabelText)
    }
    
    /// To show error/validation message to user below custom UI Textfield
    ///
    /// - Parameters:
    ///   - message: Error Messsae to Display below Text
    ///   - messageTextColor: Color of text to be shown
    func validationViewMessage(message: String, messageTextColor: UIColor) {
        messageLabelText.removeFromSuperview()
        messageLabelText = UILabel(frame: CGRect(x:0, y: 0, width: self.frame.width, height: CGFloat.greatestFiniteMagnitude))
        messageLabelText.numberOfLines = 0
        messageLabelText.lineBreakMode = .byWordWrapping
        messageLabelText.font = .systemFont(ofSize: 14)
        messageLabelText.text = message
        messageLabelText.textColor = messageTextColor
        messageLabelText.sizeToFit()
        bottomMessageView.addSubview(messageLabelText)
        messageLabelHeight = messageLabelText.frame.height
        if (message.isEmpty) {
            self.resignFirstResponder()
        }
    }
    
    /// Set Toolbar for UitextField
    func showtoolbar() {
        let doneToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
        doneToolbar.barStyle = UIBarStyle.default
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done = UIBarButtonItem(title: "Done"
            , style: UIBarButtonItem.Style.done, target: self, action: #selector(self.doneButtonButtonPressed))
        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(done)
        doneToolbar.items = items
        self.inputAccessoryView = doneToolbar
        doneToolbar.sizeToFit()
    }
    
    /// Toolbar item is pressed
    @objc func doneButtonButtonPressed() {
        customUITextFieldDelegate?.didEndEditing(textField: self)
    }
}
