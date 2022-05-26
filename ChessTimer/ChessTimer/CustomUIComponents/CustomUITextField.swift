//
//  CustomUITextField.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//  CustomTextField componenet Extension

import Foundation
import UIKit

protocol CustomUITextFieldProtocol: AnyObject {
    func didEndEditing(textField: UITextField)
}

let animationTimer20ms: TimeInterval = 0.20

@IBDesignable open class CustomUITextField: UITextField {
  
    let placeHolderSize: CGFloat = 14
    var fontSize: CGFloat = 16
    var bottomBorderHeight: CGFloat = 1
    let offset: CGFloat = 8
    var labelBottomBorder = UIView()
    var placeHolderLabel = UILabel()

    weak var customUITextFieldDelegate: CustomUITextFieldProtocol?
    
    // MARK: - Private Properties
    /// This defines the height of label
    var labelHeight: CGFloat {
        ceil(font?.withSize(placeHolderSize).lineHeight ?? 0)
    }
    
    /// This variable is used to scale up and down the label
    var scalePalceHolderLabel: CGFloat {
        placeHolderSize / fontSize
    }
        
    /// This checks where the label is empty or not and retuns value
    var isEmpty: Bool {
        text?.isEmpty ?? true
    }
    
    /// This returns the whole edgeinsets for textfield
    var textInsets: UIEdgeInsets {
        UIEdgeInsets(top: offset + labelHeight, left: 0, bottom: offset, right: 0)
    }
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    override open var intrinsicContentSize: CGSize {
        CGSize(width: bounds.width, height: textInsets.top + 32.0 + textInsets.bottom)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        labelBottomBorder.frame = CGRect(x: 0, y: bounds.height - 1, width: bounds.width, height: bottomBorderHeight)
        updateLabel()
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: textInsets)
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        .zero
    }
    
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        guard !isFirstResponder else {
            return
        }
        placeHolderLabel.transform = .identity
        placeHolderLabel.frame = bounds.inset(by: textInsets)
    }
    
    /// This method will setup all the basic needs with respect to color and fonts
    func setupUI() {
        borderStyle = .none
        font = .systemFont(ofSize: 16)
        labelBottomBorder.backgroundColor = ColorConstants.lightGray
        labelBottomBorder.isUserInteractionEnabled = false
        placeHolderLabel.textColor = ColorConstants.lightGray
        placeHolderLabel.font = .systemFont(ofSize: 16)
        placeHolderLabel.text = placeholder
        placeHolderLabel.isUserInteractionEnabled = false
        addSubview(labelBottomBorder)
        addSubview(placeHolderLabel)
        addTarget(self, action: #selector(handleTextFieldEditing), for: .allEditingEvents)
        delegate = self
    }
    
    /// This method is triggered when user clicks on customTextfield while editing
    @objc private func handleTextFieldEditing() {
        updateLabel()
        updateBorder()
    }
    
    /// This will help updating the border with color according to design
    private func updateBorder() {
        let borderColor = isFirstResponder ? ColorConstants.greenHighlighted : ColorConstants.lightGray
        bottomBorderHeight = isFirstResponder ? 2.0 : 1.0
        UIView.animate(withDuration: animationTimer20ms) {
            self.labelBottomBorder.backgroundColor = borderColor
        }
    }
    
    /// TextField State we animate
    func updateLabel() {
        let isTextFieldSelected = isFirstResponder || !isEmpty
        self.placeHolderLabel.textColor = isFirstResponder ? ColorConstants.greenHighlighted : ColorConstants.lightGray
        self.fontSize = isTextFieldSelected ? 15 : 19
        let offsetX = -placeHolderLabel.bounds.width * (1 - scalePalceHolderLabel) / 2
        let offsetY = -placeHolderLabel.bounds.height * (1 - scalePalceHolderLabel) / 2
        
        let transform = CGAffineTransform(translationX: offsetX, y: offsetY - labelHeight - offset)
            .scaledBy(x: scalePalceHolderLabel, y: scalePalceHolderLabel)
        
        UIView.animate(withDuration: animationTimer20ms) {
            self.placeHolderLabel.font = isTextFieldSelected ? .systemFont(ofSize: 16) : .systemFont(ofSize: 19)
            self.placeHolderLabel.transform = isTextFieldSelected ? transform : .identity
        }
    }
}


extension CustomUITextField: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        customUITextFieldDelegate?.didEndEditing(textField: textField)
        return false
    }
    public func textFieldDidEndEditing(_ textField: UITextField) {
        customUITextFieldDelegate?.didEndEditing(textField: textField)
    }
}

