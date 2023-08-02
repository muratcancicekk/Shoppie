//
//  Storyboard+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 2.08.2023.
//

import UIKit

protocol StoryboardInstantiable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable {

    static var storyboardIdentifier: String? { return nil }
    static func instantiate() -> Self? {

        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardIdentifier) as? Self
    }
}


protocol XIBInstantiable {
    static var xibName: String { get }
}

extension XIBInstantiable where Self: UIViewController {
    static var xibName: String {
        return String(describing: self)
    }

    static func instantiateFromXIB() -> Self? {
        return Self.init(nibName: xibName, bundle: nil)
    }
}
