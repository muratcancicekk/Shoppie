//
//  UIViewController+Extension.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import UIKit
import SwiftUI

extension UIViewController {
    @available(iOS 13, *)
    private struct Preview: UIViewControllerRepresentable {
        // this variable is used for injecting the current view controller
        let viewController: UIViewController
        
        func makeUIViewController(context: Context) -> UIViewController {
            return viewController
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            //
        }
    }
    
    @available(iOS 13, *)
    func showPreview() -> some View {
        Preview(viewController: self)
    }
    
}

protocol SeguePerformable {
    func performSegue(identifier: String)
}
extension SeguePerformable where Self: UIViewController {
    
    func performSegue(identifier: String) {
        performSegue(withIdentifier: identifier, sender: self)
    }
    
}
