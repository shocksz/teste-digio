//
//  DetailsModel.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

enum DetailsType {
    case product
    case banner
}

struct DetailsModel {
    let title: String
    let banner: String?
    let productImage: String?
    let description: String
    let type: DetailsType
}
