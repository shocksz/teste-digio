//
//  HomeViewModel.swift
//  teste-digio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import Foundation
import UIKit

final class HomeViewModel: BaseViewModel {
    // MARK: - Private Properties

    var model: HomeModel?

    // MARK: - Constants

    private let kImageNotFound = UIImage(named: "imageNotFound")

    // MARK: - Public Methods

    func getHomeModel(success: @escaping() -> Void, failure: @escaping(Error?) -> Void) {
        service.getHomeModel(
            success: { model in
                self.model = model
                success()
            },
            failure: failure
        )
    }

    var digioAttributedString: NSMutableAttributedString {
        let attrs1 = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor.digioColor
        ]
        let attrs2 = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor(red: 117/255,
                                                            green: 117/255,
                                                            blue: 117/255,
                                                            alpha: 1)
        ]
        let attributedString1 = NSMutableAttributedString(string: "digio",
                                                          attributes: attrs1)
        let attributedString2 = NSMutableAttributedString(string: " Cash",
                                                          attributes: attrs2)

        attributedString1.append(attributedString2)
        return attributedString1
    }

    var numberOfSpotlight: Int {
        model?.spotlight.count ?? 0
    }

    var numberOfProducts: Int {
        model?.products.count ?? 0
    }

    func getSpotlight(at index: Int) -> SpotlightModel? {
        model?.spotlight[index]
    }

    func getProduct(at index: Int) -> ProductModel? {
        model?.products[index]
    }

    func getSpotlightCellSize(screenSize: CGSize) -> CGSize {
        CGSize(width: screenSize.width/1.2, height: 160)
    }

    func getBannerSize(screenSize: CGSize) -> CGSize {
        CGSize(width: screenSize.width/1.2, height: 98)
    }

    var productCellSize: CGSize {
        CGSize(width: 112, height: 112)
    }

    func getBannerImage(completion: @escaping(UIImage?) -> Void) {
        ServiceManager().get(
            url: model?.cash.imageURL ?? .empty,
            success: { data in
                let image = UIImage(data: data) ?? self.kImageNotFound
                completion(image)
            },
            failure: { _ in
                completion(self.kImageNotFound)
            }
        )
    }

    func getDetailsFromBanner() -> DetailsModel {
        DetailsModel(
            title: model?.cash.title.capitalized ?? .empty,
            banner: model?.cash.imageURL,
            productImage: nil,
            description: model?.cash.description ?? .empty,
            type: .banner
        )
    }

    func getDetailsModel(at index: Int, type: DetailsType) -> DetailsModel {
        switch type {
        case .banner:
            return getDetailsModelFromSpotlight(at: index)

        case .product:
            return getDetailsModelFromProduct(at: index)
        }
    }

    // MARK: - Private Methods

    private func getDetailsModelFromProduct(at index: Int) -> DetailsModel {
        let product = getProduct(at: index)
        return DetailsModel(
            title: product?.name ?? .empty,
            banner: nil,
            productImage: product?.imageURL,
            description: product?.description ?? .empty,
            type: .product
        )
    }

    private func getDetailsModelFromSpotlight(at index: Int) -> DetailsModel {
        let spotlight = getSpotlight(at: index)
        return DetailsModel(
            title: spotlight?.name ?? .empty,
            banner: spotlight?.imageURL,
            productImage: nil,
            description: spotlight?.description ?? .empty,
            type: .banner
        )
    }
}
