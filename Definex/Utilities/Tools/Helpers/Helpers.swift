//
//  Helpers.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import Foundation

final class Helpers {
    
    static let shared = Helpers()
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }

    
}
