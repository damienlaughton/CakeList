//
//  CakeTests.swift
//  Cake ListTests
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation
import XCTest

class CakeTests: XCTestCase {

    var cake: Cake? = .none
    var mockFileURL: URL? = .none

    override func setUp() {
        self.cake = Cake()
        let testBundle = Bundle(for: type(of: self))
        self.mockFileURL = testBundle.url(forResource: "test_cake", withExtension: "png")
    }

    func testCakeCanFindValidImage() {

        guard let cake = self.cake else { XCTFail(); return }
        guard let mockFileURL = self.mockFileURL else { XCTFail(); return }

        cake.cakeImagePath = mockFileURL.path

        XCTAssertNotNil(cake.cakeImage)
    }

    func testNewCake() {
        if let newCake = Cake(dictionary: ["title" : "TITLE", "desc" : "DESCRIPTION", "image" : "PATH"]) {
            XCTAssertNotNil(newCake)
            XCTAssertNotNil(newCake.cakeName)
            XCTAssertNotNil(newCake.cakeDescription)
            XCTAssertNotNil(newCake.cakeImagePath)
            XCTAssertNil(newCake.cakeImage)
        } else {
            XCTFail()
        }
    }
}
