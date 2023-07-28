//
//  CustomButtonView.swift
//  Definex
//
//  Created by Murat Çiçek on 27.07.2023.
//

import UIKit

final class CustomButtonView: BaseView {
    
    @IBOutlet private weak var leadingIconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        buttonConfigure()
    }
    
    func customButtonSetup(leadingIconHide: Bool = false, title: String, titleColor: UIColor, bgColor: UIColor) {
        leadingIconImageView.isHidden = leadingIconHide
        titleLabel.text = title
        titleLabel.textColor = titleColor
        backgroundColor = bgColor
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
    }
}

extension CustomButtonView {
    
    // Button Configure
    private func buttonConfigure() {
        titleLabel.font = Fonts.shared.medium14
        self.makeCornerRadius(radius: 6)
    }
}
