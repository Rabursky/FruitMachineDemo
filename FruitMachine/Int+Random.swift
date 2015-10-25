//
//  Int+Random.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import Darwin

extension Int {
    func random() -> Int {
        return Int(arc4random_uniform(UInt32(self)))
    }
}
