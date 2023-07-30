//
//  LoginContracts.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import Foundation

protocol LoginViewModelInterface: AnyObject {
    var email: String { get set }
    var password: String { get set }
    var isReady: Bool { get set }
    
    var view: LoginViewInterface? {get set}
    func loginRequest()
    func viewDidLoad()
}

protocol LoginViewInterface: AnyObject {
    func configureUI()
    func activityStart()
    func activityStop()
}
