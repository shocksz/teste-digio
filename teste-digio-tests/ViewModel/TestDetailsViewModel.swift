//
//  TestDetailsViewModel.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import XCTest

@testable import TesteDigio

final class TestDetailsViewModel: XCTestCase {
    var productViewModel: DetailsViewModel?
    var bannerViewModel: DetailsViewModel?
    
    override func setUp() {
        let productDetails = DetailsModel(
            title: "XBOX",
            banner: nil,
            productImage: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
            description: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!",
            type: .product
        )
        let bannerDetails = DetailsModel(
            title: "Recarga",
            banner: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
            productImage: nil,
            description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.",
            type: .banner
        )
        productViewModel = DetailsViewModel(details: productDetails)
        bannerViewModel = DetailsViewModel(details: bannerDetails)
    }

    func testTitle() {
        let expected = "Xbox"
        let value = productViewModel?.title
        XCTAssertEqual(expected, value)
    }

    func testDescription() {
        let expected = "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!"
        let value = productViewModel?.description
        XCTAssertEqual(expected, value)
    }

    func testHideBannerOnProduct() {
        let expected = true
        let value = productViewModel?.hideBanner
        XCTAssertEqual(expected, value)
    }

    func testHideBannerOnBanner() {
        let expected = false
        let value = bannerViewModel?.hideBanner
        XCTAssertEqual(expected, value)
    }
}
