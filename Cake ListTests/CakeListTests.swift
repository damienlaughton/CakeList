//
//  CakeListTests.swift
//  Cake ListTests
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation
import XCTest

class CakeListTests: XCTestCase {

    var cakeListViewModel: CakeListViewModelWithMockData? = .none
    var mockCakeListViewController: MockCakeListViewController? = .none

    override func setUp() {
        cakeListViewModel = CakeListViewModelWithMockData()
        mockCakeListViewController = MockCakeListViewController()
    }

    func testTakeViewAndRefreshRequest() {

        guard let viewModel = cakeListViewModel else { XCTFail(); return }
        guard let view = mockCakeListViewController else { XCTFail(); return }

        viewModel.takeView(view)
        viewModel.refreshRequest()

        XCTAssertTrue(view.verifyCallsToUpdateTable(numberOfCalls: 1))
        XCTAssertTrue(view.verifyNumberOfCakes(numberOfCakes: 20))
    }
}
