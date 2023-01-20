//
//  MockService.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

final class MockService: ServiceProtocol {
    func getHomeModel(
        success: @escaping (HomeModel) -> Void,
        failure: @escaping (Error?) -> Void
    ) {
        DataUnwraperManager.shared.unwrapModelFromMockFile(
            of: HomeModel.self,
            mockFile: .home,
            success: success,
            failure: failure
        )
    }
}
