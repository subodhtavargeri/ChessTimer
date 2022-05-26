//
//  String+Localization.swift
//  ChessTimer
//
//  Created by Subodh Tavargeri on 19/05/22.
//

import Foundation

extension String {
    /// Returns a localized version of the string.
    /// - Parameter defaultValue: The value to return if key is nil or if a localized string for key can’t be found in the table.
    /// - Returns: The value assigned to this key.
    func localized(defaultValue: String? = nil) -> String {
        Bundle.main.localizedString(
            forKey: self,
            value: defaultValue ?? self,
            table: "Localization-EN"
        )
    }
    
    func checkForMaximumCharacters(maxLength: Int, rangeTochek: NSRange, textEntered: String) -> Bool {
        let nsString = self as NSString?
        let newString = (nsString?.replacingCharacters(in: rangeTochek, with: textEntered) ?? "") as String
        return newString.count <= maxLength
    }
    
}
