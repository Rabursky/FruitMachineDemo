//
//  FruitsMachinePresenter.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

class FruitMachinePresenter : FruitsMachinePresenterProtocol {
    var view: FruitsMachineViewControllerProtocol?
    func setViewController(view: FruitsMachineViewControllerProtocol) {
        self.view = view
    }
    
    func setup() {
        
    }
    
    func startRolling() {
        
    }
}