//
//  ViewController.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FruitsMachineViewControllerProtocol {
    @IBOutlet var pickerView: UIPickerView?
    var pickerDataSource: FruitMachinePickerDataSource = FruitMachinePickerDataSource()
    let presenter: FruitsMachinePresenterProtocol =
        FruitMachinePresenter(fruitMachine: FruitMachine(), fruitsInteractor: GetAllFruitsInteractor(source: FruitsJSONSource(), builder: FruitBuilder()))

    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView?.dataSource = pickerDataSource
        pickerView?.delegate = pickerDataSource
        presenter.setViewController(self)
        presenter.setup()
    }
    
    // MARK: Actions
    
    @IBAction func startMachine() {
        self.presenter.roll()
    }
    
    // MARK: FruitsMachineViewControllerProtocol

    func displayMachineState(state: [MachineStateRow], animated: Bool) {
        pickerDataSource.setState(state, animated: animated, pickerView: pickerView!)
    }
    
    func displayError(error: ErrorType) {
        print(error)
    }
}

