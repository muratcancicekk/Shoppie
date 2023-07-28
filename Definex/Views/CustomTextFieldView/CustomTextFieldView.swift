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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCustomTextView()
    }
    
    func setupTextField(placeHolder: String) {
        textField.placeholder = placeHolder
        headerLabel.text = placeHolder
    }
}

extension CustomTextFieldView {
    // Configure Text Field
    private func configureCustomTextView() {
        headerLabel.hide()
        textField.delegate = self
        textField.borderStyle = .none
        textField.font = Fonts.shared.regular16
        headerLabel.font = Fonts.shared.regular12
    }
    private func editingBeginConfigure() {
        let color1 = UIColor(red: 0.102, green: 0.451, blue: 0.914, alpha: 1)
        let color2 = UIColor(red: 0.422, green: 0.571, blue: 0.956, alpha: 1)
        
        let gradientColors = UIColor.gradientColors(colors: [color1, color2])

        UIView.animate(withDuration: 0.2) {
            self.headerLabel.show()
            self.dvider.backgroundColor = .blue
        }
    }
    private func editingEndConfigure() {
        UIView.animate(withDuration: 0.2) {
            self.dvider.backgroundColor = .blue
        }
    }
    private func textFieldEmpty() {
        UIView.animate(withDuration: 0.2) {
            self.headerLabel.hide()
            self.dvider.backgroundColor = .blue
        }
    }
    
}

// MARK: TextFieldDelegate
extension CustomTextFieldView: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
     }

     func textFieldDidBeginEditing(_ textField: UITextField) {
     }

     func textFieldDidEndEditing(_ textField: UITextField) {
     }
}
