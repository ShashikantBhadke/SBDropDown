//
//  SBPicker.swift
//  SBDropDown
//
//  Created by Shashikant Bhadke on 20/10/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

public class SBPicker {
    
    // MARK:- Variables
    private static var customInputView: UIView?
    private static let viewPicker = UIPickerView()
    private static let datePicker = UIDatePicker()
    private static var strValue = ""
    
    
    // MARK:- Public Methods
    public class func showPickerView(_ arrValues: [String],  _ txtf: UITextField, _ onDoneBtnTap: @escaping((String)->())) {
        customInputView = txtf
        
        let pickerDelegate = SBPickerDelegates(arrValues: arrValues)
        
        pickerDelegate.onValueChangeMethods = { _strValue in
            strValue = _strValue
        }
        viewPicker.delegate = pickerDelegate
        viewPicker.dataSource = pickerDelegate
        viewPicker.reloadAllComponents()
        
        txtf.inputView = viewPicker
        txtf.inputAccessoryView = getToolBar(#selector(pickerViewDoneButton))
        
        onDoneBtnTap(strValue.isEmpty ? (arrValues.first ?? "") : strValue)
    }
    
    public class func showDatePicker(_ txtf: UITextField, datePickerMode: UIDatePicker.Mode = .date, selectedDate: Date?, minDate: Date? = nil, maxDate: Date? = nil, _ onDoneBtnTap: @escaping((Date)->())) {
        customInputView = txtf
        
        datePicker.date = selectedDate ?? Date()
        datePicker.minimumDate = minDate
        datePicker.maximumDate = minDate
        datePicker.datePickerMode = datePickerMode
        
        txtf.inputView = datePicker
        txtf.inputAccessoryView = getToolBar(#selector(datePickerDoneButton))
        
        onDoneBtnTap(datePicker.date)
    }
    
    // MARK:- Private Methods
    private class func getToolBar(_ selector: Selector)->UIToolbar {
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [
            UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: .plain, target: self, action: selector)]
        toolBar.sizeToFit()
        return toolBar
    }
    
    // MARK:- Button Actions
    @objc class private func pickerViewDoneButton() {
        customInputView?.endEditing(true)
    }
    
    @objc class private func datePickerDoneButton() {
        customInputView?.endEditing(true)
    }
    
} //class
