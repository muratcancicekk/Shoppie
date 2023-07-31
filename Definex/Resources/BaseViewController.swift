//
//  BaseViewController.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import UIKit
import Combine

class BaseViewController: UIViewController {
    var cancellables: Set<AnyCancellable> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
    }
    func bind() {}
}
