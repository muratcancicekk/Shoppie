//
//  HomeProductCollectionViewCell.swift
//  Definex
//
//  Created by Murat Çiçek on 28.07.2023.
//

import UIKit

final class HomeProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var productNameLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    /// Discount
    @IBOutlet private weak var oldPriceLabel: UILabel!
    @IBOutlet private weak var discountLabel: UILabel!
    @IBOutlet private weak var discountStackView: UIStackView!
    /// Rate
    @IBOutlet private weak var starView: CustomStarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    // TODO: Burada mopdelden star bilgisi veya diğer ofter gelmez ise gizlensin
    
    func cell1() {
        productNameLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular16, textColor: .black)
        priceLabel.configureLabel(text: "", font: Fonts.shared.robotoMedium14, textColor: .black)
        oldPriceLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular12, textColor: .blue)
        discountLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular12, textColor: .pinkColor)
        starView.hide()
    }
    
    func cell2() {
        productNameLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular12, textColor: .black)
        priceLabel.configureLabel(text: "", font: Fonts.shared.robotoMedium14, textColor: .black)
        oldPriceLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular12, textColor: .blue)
        starView.hide()
        discountLabel.hide()
    }
    
    func cell3() {
        productNameLabel.configureLabel(text: "", font: Fonts.shared.robotoRegular14, textColor: .black)
        priceLabel.configureLabel(text: "", font: Fonts.shared.robotoMedium20, textColor: .black)
        discountStackView.hide()
    }
}
extension HomeProductCollectionViewCell {
  private  func configureCell() {
      self.addShadow(color: .blue, opacity: 0.4, offset: CGSize(width: 0, height: 4), radius: 8.0)
      self.makeCornerRadius(radius: 3)
      productImageView.makeCornerRadius(radius: 3)
    }
}
