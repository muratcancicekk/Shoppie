//
//  UILabel+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 28.07.2023.
//

import Foundation

import UIKit

extension UILabel {
    func configureLabel(text: String? = nil,
                        font: UIFont? = nil,
                        textColor: UIColor? = nil) {
        if let text = text,
           let font = font,
           let textColor = textColor {
            self.text = text
            self.font = font
            self.textColor = textColor
        }
    }
    func strikeThrough() {
        if let text = self.text {
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
}
