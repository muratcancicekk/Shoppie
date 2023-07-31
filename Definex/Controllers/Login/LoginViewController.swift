//
//  LoginViewController.swift
//  Definex
//
//  Created by Murat Çiçek on 30.07.2023.
//

import UIKit
import SwiftUI

final class LoginViewController: BaseViewController {
    /// Header
    @IBOutlet private weak var headerTitleLabel: UILabel!
    @IBOutlet private weak var emailTextField: CustomTextFieldView!
    @IBOutlet private weak var passwordTextField: CustomTextFieldView!
    /// Footer
    @IBOutlet private weak var loginButton: CustomButtonView!
    @IBOutlet private weak var forgotPasswordButton: CustomButtonView!
    @IBOutlet private weak var facebookButton: CustomButtonView!
    @IBOutlet private weak var twitterButton: CustomButtonView!
    
    private lazy var viewModel = LoginViewModel(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.viewDidLoad()
    }
    
    override func bind() {
        emailTextField.$fieldValue.assign(to: &viewModel.$email)
        passwordTextField.$fieldValue.assign(to: &viewModel.$password)
        viewModel.$isReady.sink { [weak self] isReady in
            guard let self = self else { return }
            self.loginButton.customButtonSetup(leadingIconHide: true, title: "LOGIN".localized(), titleColor: .black, bgColor: isReady ? Colors.customGreen ?? .green : .gray.withAlphaComponent(0.5), isEnable: isReady ? true : false)
        }.store(in: &cancellables)
    }
    
}
extension LoginViewController: LoginViewInterface {
    
    func activityStart() {
        view.activityStartAnimating(activityColor: Colors.customBlue ?? .blue, backgroundColor: Colors.customBlue?.withAlphaComponent(0.2) ?? .blue)
    }
    
    func activityStop() {
        view.activityStopAnimating()
    }
    
    func configureUI() {
        /// TextFields Configure
        headerTitleLabel.configureLabel(text: "PROJECT_TITLE".localized(), font: Fonts.shared.interBlack32, textColor: Colors.customBlue ?? .blue)
        emailTextField.setupTextField(placeHolder: "EMAIL_ADDRESS".localized(), trailingImage: AssetsName.mailFill.rawValue, isEmailTextField: true)
        passwordTextField.setupTextField(placeHolder: "PASSWORD".localized(), trailingImage: AssetsName.lockFill.rawValue, isSecureText: true)
        /// ButtonsConfigure
        loginButton.delegate = self
        loginButton.makeCornerRadius(radius: 6)
        loginButton.customButtonSetup(leadingIconHide: true, title: "LOGIN".localized(), titleColor: .black, bgColor: .gray.withAlphaComponent(0.5), isEnable: false)
        forgotPasswordButton.delegate = self
        forgotPasswordButton.customButtonSetupForgot(title: "FORGOT_PASS".localized(), titleColor: .black, bgColor: .white, buttonTag: 3)
        forgotPasswordButton.makeCornerRadius(radius: 6)
        facebookButton.delegate = self
        facebookButton.makeCornerRadius(radius: 6)
        facebookButton.customButtonSetup(imageName: AssetsName.facebookIcon.rawValue, title: "FACEBOOK".localized(), titleColor: .white, bgColor: Colors.facebookBlue ?? .blue)
        twitterButton.delegate = self
        twitterButton.makeCornerRadius(radius: 6)
        twitterButton.customButtonSetup(imageName: AssetsName.twitterIcon.rawValue, title: "TWITTER".localized(), titleColor: .white, bgColor: UIColor(named: "twitterBlue") ?? .blue)
        twitterButton.buttonAction.tag = 3
        facebookButton.buttonAction.tag = 2
        forgotPasswordButton.buttonAction.tag = 1
        loginButton.buttonAction.tag = 0
    }
    
}

extension LoginViewController: CustomButtonDidTapped {
    func didButtonTapped(_ value: Int?) {
        switch value {
        case 0:
            viewModel.loginRequest()
        default:
            let okAction = UIAlertAction(title: "GLOBAL_OK".localized(), style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "GLOBAL_CANCEL".localized(), style: .cancel, handler: nil)
            AlertManager.showAlert(title: "COMING_SOON".localized(), message: "", preferredStyle: .alert, actions: [okAction, cancelAction])
        }
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        LoginViewController().showPreview()
    }
}
#endif
