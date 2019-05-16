//
//  CakeListViewModelWithMockData.swift
//  Cake ListTests
//
//  Created by Damien Laughton on 16/05/2019.
//  Copyright © 2019 Stewart Hart. All rights reserved.
//

import Foundation

class CakeListViewModelWithMockData : CakeListViewModel {

    override func cakesURL() -> URL! {
        let cakesURL = Bundle.main.url(forResource: "CakeListMockData", withExtension: "json")
        return cakesURL
    }

    // In the mock fetch data acts synchronously
    override func fetchCakes() {
        do {
            let data = try Data(contentsOf: cakesURL())

            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)

            let cakeArray = NSMutableArray()

            if let jsonObjects = json as? [[String : Any]] {
                for jsonObject in jsonObjects {
                    let cake = Cake()

                    if let title = jsonObject["title"] as? String {
                        cake.cakeName = title
                    }
                    if let desc = jsonObject["desc"] as? String {
                        cake.cakeDescription = desc
                    }
                    if let image = jsonObject["image"] as? String {
                        cake.cakeImagePath = image
                    }

                    cakeArray.add(cake)
                }
            }

            self.viewDelegate?.updateTable(with: cakeArray as? [Cake])

        } catch {
            // Do Nothing
        }
    }
}
