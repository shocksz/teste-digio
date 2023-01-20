//
//  DetailsViewModel.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class DetailsViewModel: BaseViewModel {
    // MARK: - Private Properties

    let model: DetailsModel

    // MARK: - Constants

    private let kImageNotFound = UIImage(named: "imageNotFound")

    // MARK: - Life Cycle

    init(details: DetailsModel) {
        self.model = details
    }

    // MARK: - Public Methods

    var title: String {
        model.title.capitalized
    }

    var description: String {
        model.description
    }

    var hideBanner: Bool {
        model.type == .product
    }

    func getProductImage(completion: @escaping(UIImage?) -> Void) {
        getImage(url: model.productImage ?? .empty, completion: completion)
    }

    func getSpotlightImage(completion: @escaping(UIImage?) -> Void) {
        getImage(url: model.banner ?? .empty, completion: completion)
    }

    // MARK: - Private Properties

    private func getImage(url: String, completion: @escaping(UIImage?) -> Void) {
        ServiceManager().get(
            url: url,
            success: { data in
                completion(UIImage(data: data) ?? self.kImageNotFound)
            },
            failure: { _ in
                completion(nil)
            }
        )
    }
}
