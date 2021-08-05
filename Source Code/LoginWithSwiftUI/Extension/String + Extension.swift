//
//  String + Extension.swift
//  LoginWithSwiftUI
//
//  Created by Devubha Manek on 05/08/21.
//

import Foundation

extension String {
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegEx).evaluate(with: self)
    }
    var isValidPassword : Bool {
        // least one uppercase or lowercase,
        // least one digit
        // least one symbol
        //  min 6 characters total
        let password = self.trimmingCharacters(in: CharacterSet.whitespaces)
        let passwordRegx = "^(?=.*[a-zA-Z])(?=.*\\d)(?=.*?[#?!@$%^&<>*~:`-]).{6,}$"
        let passwordCheck = NSPredicate(format: "SELF MATCHES %@",passwordRegx)
        return passwordCheck.evaluate(with: password)

    }
}
