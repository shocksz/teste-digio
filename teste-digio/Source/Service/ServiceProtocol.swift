//
//  ServiceProtocol.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

protocol ServiceProtocol {
    func getHomeModel(success: @escaping(HomeModel) -> Void,
                      failure: @escaping(Error?) -> Void)
}
