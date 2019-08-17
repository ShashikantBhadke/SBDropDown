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
        switch textField {
        case txtfContains:
            SBDropDown.arrowDirection = .up
            var cgFrame = textField.bounds
            cgFrame.size.height = 280.0
            self.showSBDropDown(strTitle: "Select Value", arrElemets: arrModel, sourceView: textField, sourceRect: cgFrame)
            
        case txtfCreateDate:
            let strDate = (txtfCreateDate.text ?? "").isEmpty ? "01-08-2019 00:00" : (txtfCreateDate.text ?? "")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
            if let date = dateFormatter.date(from: strDate) {
                SBDropDown.arrowDirection = .down
                var cgFrame = textField.bounds
                cgFrame.size.height = 280.0
                self.showSBDatePicker(strTitle: "Created On", currentDate: date, minDate: date, maxDate: nil, sourceView: textField, sourceRect: cgFrame)
            }
        default:
            break
        }
        return false
    }
} //extension
