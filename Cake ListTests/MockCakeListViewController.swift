//
//  MockCakeListViewController.swift
//  Cake ListTests
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation

class MockCakeListViewController: NSObject, CakeListViewDelegate {

    var numberOfCallsToUpdateTable: Int = 0

    var cakes: [Cake]? = .none

    func updateTable(with cakes: [Cake]?) {
        self.cakes = cakes
        numberOfCallsToUpdateTable += 1
    }

    func verifyCallsToUpdateTable(numberOfCalls: Int) -> Bool {
        let verified = numberOfCalls == numberOfCallsToUpdateTable

        return verified
    }

    func verifyNumberOfCakes(numberOfCakes: Int) -> Bool {
        let verified = numberOfCakes == cakes?.count

        return verified
    }
}
