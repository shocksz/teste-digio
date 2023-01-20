//
//  HomeModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

struct HomeModel: Codable {
    let products: [ProductModel]
    let cash: BannerModel
    let spotlight: [SpotlightModel]
}
