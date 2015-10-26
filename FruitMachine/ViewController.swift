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
    @IBOutlet var startButton: UIButton?
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
    
    func displayWin(fruit: Fruit) {
        startButton?.enabled = false
        let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(0.6 * Double(NSEC_PER_SEC)))
        dispatch_after(delayTime, dispatch_get_main_queue()) { () -> Void in
            let alert = UIAlertController(title: "Win!", message: "You have won a free \(fruit.name)!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Great!", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alert, animated: true, completion: {[weak self] in self?.startButton?.enabled = true } )
        }
    }
}

