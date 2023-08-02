//
//  HomeProductCollectionViewCell.swift
//  Definex
//
//  Created by Murat Çiçek on 28.07.2023.
//

import UIKit
import SDWebImage

final class HomeProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var cellBgView: UIView!
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
    override func prepareForReuse() {
        super.prepareForReuse()
        productImageView.image = nil
        productNameLabel.text = nil
        priceLabel.text = nil
        oldPriceLabel.text = nil
        discountLabel.text = nil
        starView.show()
        discountStackView.show()
        starView.setupStarsUI(point: 0)
    }
    func setupCell(data: DiscoverModel.DiscoverListData?) {
        guard let data = data else { return }
        productImageView.sd_setImage(with: URL(string: data.imageURL ?? ""))
        productNameLabel.configureLabel(text: data.description,
                                        font: Fonts.shared.robotoRegular16,
                                        textColor: .black)
        priceLabel.configureLabel(text: "\(data.price?.value ?? 0) \(data.price?.currency ?? "")",
                                  font: Fonts.shared.robotoMedium14,
                                  textColor: .black)
        oldPriceLabel.configureLabel(text: "\(data.oldPrice?.value ?? 0) \(data.oldPrice?.currency ?? "")",
                                     font: Fonts.shared.robotoRegular12,
                                     textColor: .black)
        oldPriceLabel.strikeThrough()
        discountLabel.configureLabel(text: data.discount,
                                     font: Fonts.shared.robotoRegular12,
                                     textColor: .pinkColor)
        starView.setupStarsUI(point: data.ratePercentage ?? 0)
        if data.oldPrice == nil {
            discountStackView.hide()
            priceLabel.font = Fonts.shared.robotoMedium20
        } else if data.ratePercentage == nil {
            starView.hide()
        }
    }
}
extension HomeProductCollectionViewCell {
    private  func configureCell() {
        cellBgView.addShadow(color: .black, opacity: 0.08, offset: CGSize(width: 3, height: 4), radius: 8.0)
        cellBgView.makeCornerRadius(radius: 6)
        productImageView.makeCornerRadius(radius: 6)
    }
}
