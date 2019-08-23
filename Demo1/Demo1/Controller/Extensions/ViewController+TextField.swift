//
//  ViewController+TextView.swift
//  Demo1
//
//  Created by Shashikant Bhadke on 11/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import SBDropDown

// MARK :- Extensio For - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        isCallSetUP = true
        
        switch textField {
            
        case txtfContains:
            SBDropDown.shared.isMultiSelect = true
            SBDropDown.shared.arrowDirection = [.up, .down]
            
            var cgFrame = textField.bounds
            cgFrame.size.height = 280.0
            var arrSelectedIndex = [Int]()
            if let _intIndex = self.intSelected {
                arrSelectedIndex = [_intIndex]
            }
            self.showSBDropDown(strTitle: "Select Value", arrSelectedIndex: arrSelectedIndex, arrElemets: arrModel,sourceView: textField, sourceRect: cgFrame, key: textField)
            
        case txtfContains1:
            SBDropDown.shared.isMultiSelect = false
            SBDropDown.shared.arrowDirection = [.up, .down]
            
            isCallSetUP = false
            
            var cgFrame = textField.bounds
            cgFrame.size.height = 280.0
            var arrSelectedIndex = [Int]()
            if let _intIndex = self.intSelected {
                arrSelectedIndex = [_intIndex]
            }
            self.showSBDropDown(strTitle: "Select Value", arrSelectedIndex: arrSelectedIndex, arrElemets: arrModel,sourceView: textField, sourceRect: cgFrame, key: textField)
            
        case txtfCreateDate:
            let strDate = (txtfCreateDate.text ?? "").isEmpty ? "01-08-2019 00:00" : (txtfCreateDate.text ?? "")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            if let date = dateFormatter.date(from: strDate) {
                SBDropDown.shared.arrowDirection = .down
                var cgFrame = textField.bounds
                cgFrame.size.height = 280.0
                self.showSBDatePicker(strTitle: "CREATED ON", currentDate: date, minDate: date, maxDate: nil, sourceView: textField, sourceRect: cgFrame, key: textField)
            }
            
        case txtfCreateDate1:
            let strDate = (txtfCreateDate1.text ?? "").isEmpty ? "01-08-2019 00:00" : (txtfCreateDate1.text ?? "")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            if let date = dateFormatter.date(from: strDate) {
                self.showSBActionDatePicker(strTitle: "CREATED ON", currentDate: date, minDate: date, maxDate: nil, sourceView: textField, key: textField)
            }
        default:
            break
        }
        return false
    }
} //extension
