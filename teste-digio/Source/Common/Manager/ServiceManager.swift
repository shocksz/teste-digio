//
//  ServiceManager.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

final class ServiceManager {
    // MARK: - Constants

    var kUrlError = NSError(
        domain: NSStringFromClass(Service.self),
        code: -1,
        userInfo: [kCFErrorLocalizedDescriptionKey as String: "Url Error"]
    )

    // MARK: - Public Methods

    func get(
        url: String,
        timeout: Int = 60,
        success: @escaping (Data) -> Void,
        failure: @escaping (Error?) -> Void
    ) {
        guard let url = URL(string: url) else {
            failure(kUrlError)
            return
        }
        let request = URLRequest(url: url)
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = TimeInterval(timeout)
        let session = Foundation.URLSession(configuration: configuration)

        session.dataTask(with: request) { (data, _, error) -> Void in
            guard let data = data else {
                failure(error)
                return
            }
            success(data)
        }.resume()
    }
}
