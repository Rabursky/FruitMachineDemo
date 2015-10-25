//
//  ViewController.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FruitsMachineViewControllerProtocol {
    @IBOutlet weak var pickerView: UIPickerView?
    
    let presenter: FruitsMachinePresenterProtocol =
        FruitMachinePresenter(fruitMachine: FruitMachine(), fruitsInteractor: GetAllFruitsInteractor(source: FruitsJSONSource(), builder: FruitBuilder()))

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setViewController(self)
        presenter.setup()
    }
    
    // MARK: Actions
    
    @IBAction func startMachine() {
        self.presenter.roll()
    }
    
    // MARK: FruitsMachineViewControllerProtocol

    func displayMachineState(state: AnyObject, animated: Bool) {
        
    }
    
    func displayError(error: ErrorType) {
        print(error)
    }
}

