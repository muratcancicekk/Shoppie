//
//  LoginViewModel.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import Foundation
import Combine

final class LoginViewModel {
    
    weak var view: LoginViewInterface?
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isReady: Bool = false
    private var cancellables: Set<AnyCancellable> = []
    
    init(view: LoginViewInterface?) {
        self.view = view
    }
}

extension LoginViewModel: LoginViewModelInterface {
    
    func loginRequest() {
        view?.activityStart()
        let model = LoginModel.Request(email: email, password: password)
        NetworkManager.shared.request(with: .login, model: model) { [weak self] (response: Result<LoginModel.Response, NetworkError>) in
            guard let self = self else { return }
            switch response {
            case .success(let success):
                UserDefaultsOrganizer.token.save(data: success.token)
                DispatchQueue.main.async {
                    self.view?.activityStop()
                }
            case .failure(let error):
                LoggerManager.log(.error, error.localizedDescription)
                DispatchQueue.main.async {
                    self.view?.activityStop()
                }
            }
        }
    }
    
    private func start() {
        Publishers.CombineLatest($email, $password).map {
            email, password in
            return Helpers.shared.isValidEmail(email: email) && !password.isEmpty
        }
        .assign(to: \.isReady, on: self)
        .store(in: &cancellables)
    }
    
    func viewDidLoad() {
        start()
        view?.configureUI()
    }
    
}
