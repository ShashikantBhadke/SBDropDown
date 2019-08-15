//
//  ViewController+SBTableProtocol.swift
//  Demo1
//
//  Created by Shashikant Bhadke on 11/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import SBDropDown

// MARK :- Extensio For - SBTableProtocol
extension ViewController: SBTableProtocol {
    func configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?) {
        if let str = currentData as? String {
            cell.lblTitle.text = str
            cell.imgSelected = #imageLiteral(resourceName: "correct")
            cell.isSelected(arrSelectedIndex.contains(currentIndex))
        }
    }
    
    func didSelectCell(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, key: Any?) {
    }
    
    func btnSelectSBProtocolPressed(arrSelectedIndex: [Int], arrElements: [Any], key: Any?) {
        var strJoined = ""
        for index in arrSelectedIndex {
            if index < arrModel.count {
                strJoined = strJoined.isEmpty ? arrModel[index] : (strJoined + ", " + arrModel[index])
            }
        }
        txtfContains.text = strJoined
    }
} //extension
