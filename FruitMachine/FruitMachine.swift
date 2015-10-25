//
//  FruitMachine.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

class FruitMachine {
    var fruits: [Fruit] = []
    var rows: Int = 3
    
    func getNextState() -> [Fruit] {
        var state = [Fruit]()
        for _ in 0..<rows {
            state.append(fruits.sample())
        }
        return state
    }
}
