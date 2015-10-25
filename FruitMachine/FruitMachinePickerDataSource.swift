//
//  FruitMachinePickerDelegate.swift
//  FruitMachine
//
//  Created by Marcin Rabursky on 25/10/2015.
//  Copyright © 2015 Marcin Raburski. All rights reserved.
//

import UIKit

@objc class FruitMachinePickerDataSource: NSObject, UIPickerViewDataSource, UIPickerViewDelegate {
    var machineStateRows: [MachineStateRow] = []
    let delay = 0.06
    
    func setState(state: [MachineStateRow], animated: Bool, pickerView: UIPickerView) {
        let oldState = machineStateRows
        machineStateRows = state
        pickerView.reloadAllComponents()
        for component in 0..<state.count {
            let itemsCount = state[component].items.count
            if oldState.count > component {
                pickerView.selectRow(oldState[component].selectedIndex + itemsCount, inComponent: component, animated: false)
            }
            
            let delayTime = dispatch_time(DISPATCH_TIME_NOW, Int64(delay * Double(component) * Double(NSEC_PER_SEC)))
            dispatch_after(delayTime, dispatch_get_main_queue()) { [weak pickerView] () -> Void in
                pickerView?.selectRow(state[component].selectedIndex + itemsCount * 2, inComponent: component, animated: animated)
            }
            
        }
    }
    
    // Auxilary
    
    func rowHeightForPickerView(pickerView: UIPickerView) -> CGFloat {
        return pickerView.frame.size.width / CGFloat(machineStateRows.count) / CGFloat(3)
    }
    
    // MARK: Picker DataSource and Delegate
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return machineStateRows.count
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return machineStateRows[component].items.count * 4
    }
    
    func pickerView(pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return self.rowHeightForPickerView(pickerView)
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let fruit = machineStateRows[component].items[row % 4]
        return fruit.name
    }
    
//    func pickerView(pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusingView view: UIView?) -> UIView {
//        let fruit = machineStateRows[component].items[row % 4]
//        let image = UIImage(named: fruit.imageName)
//        
//        // for some reason PickerView is not reusing any views hence the performance issue
//        let imageView = view as? UIImageView ?? UIImageView()
//        imageView.frame = CGRectMake(0, 0, pickerView.rowSizeForComponent(component).width, self.rowHeightForPickerView(pickerView))
//        imageView.image = image
//        imageView.contentMode = UIViewContentMode.ScaleAspectFit
//        return imageView
//    }
}
