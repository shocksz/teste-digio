//
//  BannerModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

struct BannerModel: Codable {
    let title: String
    let imageURL: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case title, description
        case imageURL = "bannerURL"
    }
}
