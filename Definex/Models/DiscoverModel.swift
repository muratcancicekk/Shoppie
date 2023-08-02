//
//  DiscoverModel.swift
//  Definex
//
//  Created by Murat Çiçek on 31.07.2023.
//

import Foundation

enum DiscoverModel {

    struct DiscoverResponce: Codable {
        let isSuccess: Bool?
        let message, statusCode: String?
        let list: [DiscoverListData]?
    }

    struct DiscoverListData: Codable {
        let imageURL: String?
        let description: String?
        let price: Price?
        let oldPrice: Price?
        let discount: String?
        let ratePercentage: Int?

        enum CodingKeys: String, CodingKey {
            case imageURL = "imageUrl"
            case description, price, oldPrice, discount, ratePercentage
        }
    }

    struct Price: Codable {
        let value: Double?
        let currency: String?
    }
    
    struct EmptyRequest: Codable { }

}
