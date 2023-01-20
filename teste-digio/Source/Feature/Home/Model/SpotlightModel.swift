//
//  SpotlightModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

struct SpotlightModel: Codable {
    let name: String
    let imageURL: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case name, description
        case imageURL = "bannerURL"
    }
}
