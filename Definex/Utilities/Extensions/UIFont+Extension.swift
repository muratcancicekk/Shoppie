//
//  UIFont+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

extension UIFont {

    public enum FontTypeRoboto: String {
        case black = "-Black"
        case blackItalic = "-BlackItalic"
        case bold = "-Bold"
        case boldItalic = "-BoldItalic"
        case italic = "-Italic"
        case light = "-Light"
        case lightItalic = "-LightItalic"
        case medium = "-Medium"
        case mediumItalic = "-MediumItalic"
        case regular = "-Regular"
        case thin = "-Thin"
        case thinItalic = "-ThinItalic"
    }
    
    public enum FontTypeInter: String {
        case black = "-Black"
    }

    static func robotoFont(_ type: FontTypeRoboto = .medium, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Roboto\(type.rawValue)", size: size)!
    }
    
    static func interFont(_ type: FontTypeInter = .black, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "Inter\(type.rawValue)", size: size)!
    }

}
