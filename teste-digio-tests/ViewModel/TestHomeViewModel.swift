//
//  TestHomeViewModel.swift
//  teste-digio-tests
//
//  Created by Fernando Mesquita on 19/01/23.
//

import XCTest

@testable import TesteDigio

final class TestHomeViewModel: XCTestCase {
    var viewModel: HomeViewModel?

    override func setUp() {
        let viewModel = HomeViewModel()
        viewModel.getHomeModel(
            success: {
                self.viewModel = viewModel
            }, failure: { _ in
                XCTAssert(false)
            }
        )
    }

    func testNumberOfSpotlight() {
        let value = viewModel?.numberOfSpotlight
        let expected = 2
        XCTAssertEqual(value, expected)
    }

    func testNumberOfProducts() {
        let value = viewModel?.numberOfProducts
        let expected = 3
        XCTAssertEqual(value, expected)
    }

    func testGetProduct() {
        let value = viewModel?.getProduct(at: 0)
        let expected = ProductModel(
            name: "XBOX",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
            description: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!"
        )
        XCTAssertEqual(value?.name, expected.name)
        XCTAssertEqual(value?.imageURL, expected.imageURL)
        XCTAssertEqual(value?.description, expected.description)
    }

    func testGetSpotlight() {
        let value = viewModel?.getSpotlight(at: 0)
        let expected = SpotlightModel(
            name: "Recarga",
            imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
            description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura."
        )
        XCTAssertEqual(value?.name, expected.name)
        XCTAssertEqual(value?.imageURL, expected.imageURL)
        XCTAssertEqual(value?.description, expected.description)
    }

    func testProductCellSize() {
        let expected = CGSize(width: 112, height: 112)
        let value = viewModel?.productCellSize
        XCTAssertEqual(expected, value)
    }

    func testBannerSize() {
        let fictionalScreenSize = CGSize(width: 100, height: 100)
        let expected = CGSize(width: 100/1.2, height: 98)
        let value = viewModel?.getBannerSize(screenSize: fictionalScreenSize)
        XCTAssertEqual(expected, value)
    }

    func testSpotlightSize() {
        let fictionalScreenSize = CGSize(width: 100, height: 100)
        let expected = CGSize(width: 100/1.2, height: 160)
        let value = viewModel?.getSpotlightCellSize(screenSize: fictionalScreenSize)
        XCTAssertEqual(expected, value)
    }

    func testDigioAttributedText() {
        let attrs1 = [
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18),
            NSAttributedString.Key.foregroundColor: UIColor(red: 58/255,
                                                            green: 73/255,
                                                            blue: 98/255,
                                                            alpha: 1)
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
        let value = viewModel?.digioAttributedString
        XCTAssertEqual(value, attributedString1)
    }

    func testGetDetailsFromBanner() {
        let expected = DetailsModel(
            title: "Digio Cash",
            banner: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
            productImage: nil,
            description: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta.",
            type: .banner
        )
        let value = viewModel?.getDetailsFromBanner()
        XCTAssertEqual(value?.title, expected.title)
        XCTAssertEqual(value?.banner, expected.banner)
        XCTAssertEqual(value?.description, expected.description)
    }

    func testGetDetailsFromProduct() {
        let expected = DetailsModel(
            title: "XBOX",
            banner: nil,
            productImage: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
            description: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!",
            type: .product
        )
        let value = viewModel?.getDetailsModel(at: 0, type: .product)
        XCTAssertEqual(value?.title, expected.title)
        XCTAssertEqual(value?.productImage, expected.productImage)
        XCTAssertEqual(value?.description, expected.description)
    }

    func testGetDetailsFromSpotlight() {
        let expected = DetailsModel(
            title: "Recarga",
            banner: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
            productImage: nil,
            description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.",
            type: .banner
        )
        let value = viewModel?.getDetailsModel(at: 0, type: .banner)
        XCTAssertEqual(value?.title, expected.title)
        XCTAssertEqual(value?.banner, expected.banner)
        XCTAssertEqual(value?.description, expected.description)
    }
}
