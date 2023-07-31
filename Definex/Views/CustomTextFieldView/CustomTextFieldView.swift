//
//  CustomTextFieldView.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

final class CustomTextFieldView: BaseView {
    
    @IBOutlet private weak var headerLabel: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var trailingImageView: UIImageView!
    @IBOutlet private weak var dvider: UIView!
    @IBOutlet weak var dviderHeightConstraint: NSLayoutConstraint!
    
    var isEmailTextField = false
    
    @Published var fieldValue = "" {
        didSet {
            let isValid = Helpers.shared.isValidEmail(email: fieldValue)
            
            if !fieldValue.isEmpty && !isEmailTextField{
                textField.text = fieldValue
                editingBeginConfigure()
            } else if isEmailTextField && !isValid {
                wrongText()
            } else if isValid {
                editingBeginConfigure()
            }
            else {
                editingEndConfigure()
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCustomTextView()
    }
    
    func setupTextField(placeHolder: String,trailingImage: String, isEmailTextField: Bool = false, isSecureText: Bool = false) {
        textField.placeholder = placeHolder
        headerLabel.text = placeHolder
        trailingImageView.image = UIImage(systemName: trailingImage)
        textField.isSecureTextEntry = isSecureText
        self.isEmailTextField = isEmailTextField
    }
}

extension CustomTextFieldView {
    // Configure Text Field
    private func configureCustomTextView() {
        headerLabel.hide()
        textField.delegate = self
        textField.borderStyle = .none
        textField.font = Fonts.shared.robotoRegular16
        headerLabel.font = Fonts.shared.robotoRegular12
        trailingImageView.tintColor = .gray.withAlphaComponent(0.5)
        
    }
    private func editingBeginConfigure() {
        headerLabel.show()
        dvider.backgroundColor = Colors.customBlue ?? .blue
        dviderHeightConstraint.constant = 2
        trailingImageView.tintColor = .gray
    }
    private func editingEndConfigure() {
        dvider.backgroundColor = .gray
        dviderHeightConstraint.constant = 1
        trailingImageView.tintColor = .gray.withAlphaComponent(0.5)
        headerLabel.hide()
    }
    
    private func wrongText() {
        headerLabel.show()
        dvider.backgroundColor = .red
        trailingImageView.tintColor = .red
    }
    
}

// MARK: TextFieldDelegate
extension CustomTextFieldView: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? true {
            editingEndConfigure()
        }
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        fieldValue = textField.text ?? ""
    }
    
}

