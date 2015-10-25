//
//  Array+Sample.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import Darwin

extension Array {
    func sample() -> Element {
        let randomIndex = Int(arc4random_uniform(UInt32(self.count)))
        return self[randomIndex]
    }
}