//
//  FruitMachine.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import Darwin

struct MachineStateRow {
    let items: [Fruit]
    let selectedIndex: Int
}

class FruitMachine {
    var state: [MachineStateRow] = []
    
    func configure(fruits: [Fruit], rows: Int = 3) {
        var state = [MachineStateRow]()
        for _ in 0..<rows {
            state.append(MachineStateRow(items: self.randomFruitsOrderWithFruits(fruits), selectedIndex: 0))
        }
        self.state = state
    }
    
    func randomFruitsOrderWithFruits(fruits: [Fruit]) -> [Fruit] {
        var randomList = [Fruit]()
        var editableList = fruits
        for _ in 0..<fruits.count {
            let randomIndex = editableList.count.random()
            randomList.append(editableList[randomIndex])
            editableList.removeAtIndex(randomIndex)
        }
        return randomList
    }
    
    func getNextState() -> [MachineStateRow] {
        var newState = [MachineStateRow]()
        for row in state {
            newState.append(MachineStateRow(items: row.items, selectedIndex: row.items.count.random()))
        }
        state = newState
        return newState
    }
}
