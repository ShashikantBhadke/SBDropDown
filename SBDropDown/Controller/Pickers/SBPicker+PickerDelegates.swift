//
//  SBPicker+PickerDelegates.swift
//  SBDropDown
//
//  Created by Shashikant Bhadke on 20/10/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

internal class SBPickerDelegates: NSObject {
    
    //MARK:- Variables
    private var arrPickerValue = [String]()
    var onValueChangeMethods: ((_ strValue: String)->())?
    
    //MARK:- Init Methods
    required init(arrValues: [String]) {
        arrPickerValue = arrValues
    }
} //class

// MARK:- Extension for - UIPickerViewDelegate & UIPickerViewDataSource
extension SBPickerDelegates: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrPickerValue.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if arrPickerValue.count > row {
            return arrPickerValue[row]
        } else {
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if arrPickerValue.count > row {
            onValueChangeMethods?(arrPickerValue[row])
        }
    }
} //extension
