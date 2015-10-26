//
//  FruitsMachineViewProtocol.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

protocol FruitsMachineViewControllerProtocol {
    func displayMachineState(state: [MachineStateRow], animated: Bool)
    func displayError(error: ErrorType)
    func displayWin(fruit: Fruit)
}
