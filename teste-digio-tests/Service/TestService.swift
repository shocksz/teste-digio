//
//  TestService.swift
//  TesteDigio
//
//  Created by Fernando Mesquita on 19/01/23.
//

import XCTest

@testable import TesteDigio

final class TestService: XCTestCase {
    let service: ServiceProtocol = MockService()

    func testGetHomeModel() {
        let expectation = expectation(description: "homeModel")
        var model: HomeModel?

        service.getHomeModel(
            success: { result in
                model = result
                expectation.fulfill()
            },
            failure: { _ in
                XCTAssert(false)
            }
        )

        waitForExpectations(timeout: 3)
        XCTAssertNotNil(model)
    }
}
