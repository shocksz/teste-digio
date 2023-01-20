//
//  Service.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

enum ApiUrl: String {
    case getHomeModel = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"
}

final class Service: ServiceProtocol {
    // MARK: - Constants

    var kUrlError = NSError(
        domain: NSStringFromClass(Service.self),
        code: -1,
        userInfo: [kCFErrorLocalizedDescriptionKey as String: "Url Error"]
    )

    // MARK: - Public Methods

    func getHomeModel(
        success: @escaping (HomeModel) -> Void,
        failure: @escaping (Error?) -> Void
    ) {
        ServiceManager().get(
            url: ApiUrl.getHomeModel.rawValue,
            success: { data in
                DataUnwraperManager.shared.unwrapModel(
                    of: HomeModel.self,
                    data: data,
                    success: success,
                    failure: failure
                )
            },
            failure: failure
        )
    }
}
