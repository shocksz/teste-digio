//
//  DataUnwraper.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation

final class DataUnwraperManager {
    static let shared = DataUnwraperManager()

    func unwrapModel<T: Decodable>(
        of type: T.Type,
        data: Data,
        success: @escaping(T) -> Void,
        failure: @escaping(Error) -> Void
    ) {
        do {
            let model: T = try JSONDecoder().decode(T.self, from: data)
            success(model)
        } catch {
            failure(error)
        }
    }

    func unwrapModelFromMockFile<T: Decodable>(
        of type: T.Type,
        mockFile: MockFileName,
        success: @escaping(T) -> Void,
        failure: @escaping(Error) -> Void
    ) {
        if let path = Bundle.main.path(
            forResource: mockFile.rawValue,
            ofType: MockFileName.jsonExtension.rawValue
        ) {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                DataUnwraperManager.shared.unwrapModel(
                    of: T.self,
                    data: data,
                    success: { model in
                        success(model)
                    },
                    failure: { error in
                        failure(error)
                    }
                )
            } catch {
                failure(error)
            }
        }
    }
}
