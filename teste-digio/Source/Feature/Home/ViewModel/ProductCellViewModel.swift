//
//  ProductCellViewModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class ProductCellViewModel: BaseViewModel {
    // MARK: - Private Properties

    private let model: ProductModel

    // MARK: - Constants

    private let kImageNotFound = UIImage(named: "imageNotFound")
    private let kImageFetchTimeout = 10

    // MARK: - Life Cycle

    init(product: ProductModel) {
        self.model = product
    }

    // MARK: - Public Methods

    func getImage(completion: @escaping(UIImage?) -> Void) {
        ServiceManager().get(
            url: model.imageURL,
            timeout: kImageFetchTimeout,
            success: { data in
                completion(UIImage(data: data) ?? self.kImageNotFound)
            },
            failure: { _ in
                completion(self.kImageNotFound)
            }
        )
    }
}
