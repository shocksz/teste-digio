//
//  SpotlightCellViewModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class SpotlightCellViewModel: BaseViewModel {
    // MARK: - Private Properties

    private let model: SpotlightModel

    // MARK: - Life Cycle

    init(spotlight: SpotlightModel) {
        self.model = spotlight
    }

    // MARK: - Public Methods

    func getImage(completion: @escaping(UIImage?) -> Void) {
        ServiceManager().get(
            url: model.imageURL,
            success: { data in
                completion(UIImage(data: data) ?? UIImage(named: "imageNotFound"))
            },
            failure: { _ in
                completion(nil)
            }
        )
    }
}
