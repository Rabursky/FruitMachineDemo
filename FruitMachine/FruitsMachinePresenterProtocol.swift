//
//  FruitsMachinePresenterProtocol.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

protocol FruitsMachinePresenterProtocol {
    func setViewController(view: FruitsMachineViewControllerProtocol)
    func setup()
    func roll()
}
