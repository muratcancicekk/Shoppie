//
//  String+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import UIKit

extension String {
    
    //Locazitaion functions
    func localized() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: .main, value: self, comment: self)
    }
    func localized(number: Int) -> String {
        return String(format: self.localized(), "\(number)")
    }
    
    func localized(value: String) -> String {
        return String(format: self.localized(), value)
    }
    
    func attributedLocalized() -> NSMutableAttributedString {
        return NSMutableAttributedString(string: localized())
    }
    
}

