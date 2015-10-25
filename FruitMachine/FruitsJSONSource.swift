//
//  FruitsJSONSource.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import SwiftyJSON

class FruitsJSONSource: JSONSounrceProtocol {
    func getJSON() throws -> JSON {
        // potentially could load the names dynamically
        return JSON([
                ["name":"apple", "imageName":"apple"],
                ["name":"banana", "imageName":"banana"],
                ["name":"cherry", "imageName":"cherry"],
                ["name":"coconut", "imageName":"coconut"],
                ["name":"grapefruit", "imageName":"grapefruit"],
                ["name":"kiwi", "imageName":"kiwi"],
                ["name":"lemon", "imageName":"lemon"],
                ["name":"lime", "imageName":"lime"],
                ["name":"maracuja", "imageName":"maracuja"],
                ["name":"starfruit", "imageName":"starfruit"],
                ["name":"strawberry", "imageName":"strawberry"],
                ["name":"watermelon", "imageName":"watermelon"]
            ])
    }
}
