//
//  Enums.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import UIKit

public enum AssetsName: String {
    case mailFill = "mail.fill"
    case lockFill = "lock.fill"
    case facebookIcon = "facebookIcon"
    case twitterIcon = "twitterIcon"
}

public enum Colors {
    static let twitterBlue = UIColor(named: "twitterBlue")
    static let facebookBlue = UIColor(named: "facebookBlue")
    static let customGreen = UIColor(named: "customGreen")
    static let customBlue = UIColor(named: "customBlue")
}
enum DeepLink: String {
    case home
}
