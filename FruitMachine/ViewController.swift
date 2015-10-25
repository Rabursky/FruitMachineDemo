//
//  ViewController.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 22/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, FruitsMachineViewControllerProtocol, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var pickerView: UIPickerView?
    var machineStateRows: [MachineStateRow] = []
    
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

    func displayMachineState(state: [MachineStateRow], animated: Bool) {
        machineStateRows = state
        pickerView?.reloadAllComponents()
        for component in 0..<state.count {
            pickerView?.selectRow(state[component].selectedIndex, inComponent: component, animated: animated)
        }
    }
    
    func displayError(error: ErrorType) {
        print(error)
    }
    
    // MARK: Picker
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return machineStateRows.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return machineStateRows[component].items.count
    }
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let fruit = machineStateRows[component].items[row]
        return NSAttributedString(string: fruit.name)
    }
}

