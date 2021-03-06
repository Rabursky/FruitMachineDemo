//
//  Fruit.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

class Fruit {
    let name: String
    let imageName: String
    init(name: String, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

extension Fruit: Equatable {}
func ==(lhs: Fruit, rhs: Fruit) -> Bool {
    return lhs.name == rhs.name && lhs.imageName == rhs.imageName
}
