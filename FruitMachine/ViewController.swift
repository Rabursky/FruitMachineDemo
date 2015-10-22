//
//  ViewController.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FruitsMachineViewControllerProtocol {
    let presenter: FruitsMachinePresenterProtocol = FruitMachinePresenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewController(self)
        presenter.setup()
    }
    
    // MARK: Actions
    
    @IBAction func startMachine() {
        self.presenter.startRolling()
    }
    
    // MARK: FruitsMachineViewControllerProtocol

    func displayMachineWithFruits() {
        
    }
    
    func animateMachine() {
        
    }
    
    func stopMachineAtResult() {
        
    }
}

