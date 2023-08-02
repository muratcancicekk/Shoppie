//
//  CustomStarView.swift
//  Definex
//
//  Created by Murat Çiçek on 28.07.2023.
//
// swiftlint:disable identifier_name

import UIKit

final class CustomStarView: BaseView {
    @IBOutlet weak var starStackView: UIStackView!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func setupStarsUI(point: Int) {
        let views = [star1, star2, star3, star4, star5]
        views.forEach { $0?.image = UIImage(systemName: "star") }
        views.forEach { $0?.tintColor = Colors.customGreen }
        let filledStarCount = point / 20
        let remainder = point % 20
        for i in 0..<filledStarCount {
            views[i]?.image = UIImage(systemName: "star.fill")
        }
        if remainder >= 10 && filledStarCount < views.count {
            views[filledStarCount]?.image = UIImage(systemName: "star.lefthalf.fill")
        }
    }
}
