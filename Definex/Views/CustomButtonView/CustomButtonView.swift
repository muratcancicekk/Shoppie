//
//  CustomButtonView.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

protocol CustomButtonDidTapped: AnyObject {
    func didButtonTapped(_ value: Int?)
}

final class CustomButtonView: BaseView {
    @IBOutlet  weak var buttonAction: UIButton!
    @IBOutlet private weak var leadingIconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    var delegate: CustomButtonDidTapped?
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonConfigure()
    }
    func customButtonSetup(leadingIconHide: Bool = false,
                           imageName: String = "",
                           title: String,
                           titleColor: UIColor,
                           bgColor: UIColor, isEnable: Bool = true) {
        leadingIconImageView.isHidden = leadingIconHide
        leadingIconImageView.image = UIImage(named: imageName)
        titleLabel.text = title
        titleLabel.textColor = titleColor
        backgroundColor = bgColor
        buttonAction.isEnabled = isEnable
    }
    func customButtonSetupForgot(title: String,
                                 titleColor: UIColor,
                                 bgColor: UIColor) {
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = Fonts.shared.robotoMedium10
        leadingIconImageView.hide()
        backgroundColor = bgColor
            layer.borderWidth = 1
        layer.borderColor = Colors.customBlue?.cgColor ?? UIColor.blue.cgColor
    }
    @IBAction func buttonTapped(_ sender: Any) {
        delegate?.didButtonTapped((sender as? UIButton)?.tag)
    }
}

// Button Configure
extension CustomButtonView {
    private func buttonConfigure() {
        titleLabel.font = Fonts.shared.robotoMedium14
    }
}
