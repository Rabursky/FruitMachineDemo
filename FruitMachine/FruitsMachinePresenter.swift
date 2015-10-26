//
//  FruitsMachinePresenter.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

class FruitMachinePresenter : FruitsMachinePresenterProtocol {
    let fruitMachine: FruitMachine
    let interactor: GetAllFruitsInteractor
    init(fruitMachine: FruitMachine, fruitsInteractor: GetAllFruitsInteractor) {
        self.fruitMachine = fruitMachine
        self.interactor = fruitsInteractor
    }
    
    var view: FruitsMachineViewControllerProtocol?
    func setViewController(view: FruitsMachineViewControllerProtocol) {
        self.view = view
    }
    
    func setup() {
        do {
            try self.interactor.execute()
        } catch let error {
            view?.displayError(error)
        }
        
        if let fruits = self.interactor.output {
            self.fruitMachine.configure(fruits)
            view?.displayMachineState(self.fruitMachine.getNextState(), animated: false)
        }
    }
    
    func roll() {
        let nextState = self.fruitMachine.getNextState()
        view?.displayMachineState(nextState, animated: true)
        if let fruit = winningFruit(nextState) {
            view?.displayWin(fruit)
        }
    }
    
    func winningFruit(state: [MachineStateRow]) -> Fruit? {
        var fruit: Fruit?
        for row in state {
            let rowFruit = row.items[row.selectedIndex]
            if fruit == nil {
                fruit = rowFruit
            } else if fruit != rowFruit {
                return nil
            }
        }
        return fruit
    }
}