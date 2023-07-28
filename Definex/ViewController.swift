//
//  ViewController.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = LoginModel.Request(email: "test@test.com", password: "123456")
        NetworkManager.shared.request(with: .login, model: model) { (response: Result<LoginModel.Response, NetworkError>) in
            switch response {
            case .success(let success):
                print("*", success)
            case .failure(let failure):
                print("*",failure)
            }
        }
    }


}

