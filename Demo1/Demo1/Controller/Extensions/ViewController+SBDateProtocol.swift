//
//  ViewController+SBDateProtocol.swift
//  Demo1
//
//  Created by Shashikant Bhadke on 11/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import SBDropDown

// MARK :- Extensio For - SBDateProtocol
extension ViewController: SBDateProtocol {
    
    func didSBDateValueChanged(date: Date, key: Any?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:MM"
        let strDate = dateFormatter.string(from: date)
        txtfCreateDate.text = strDate
    }
    
    func btnSBSelectPressed(date: Date, key: Any?) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMM-yyyy HH:MM"
        let strDate = dateFormatter.string(from: date)
        txtfCreateDate.text = strDate
    }
} //extension
