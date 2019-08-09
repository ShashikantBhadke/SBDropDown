//
//  UIViewController+Extension.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension for Helper Functions
public extension UIViewController {
    
    func showDropDown(strTitle: String = "Select Value", arrSelectedIndex: [Int] = [], arrElemets: [Any], sourceView: UIView, sourceRect: CGRect? = nil, key: Any? = nil) {
        SBDropDown.showSBDropDown(strTitle: strTitle, delegate: self, arrSelectedIndex: arrSelectedIndex, arrElements: arrElemets, sourceView: sourceView, sourceRect: sourceRect ?? sourceView.bounds, key: key)
    }
    
    func showDatePicker(strTitle: String = "Select Value", currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, formatter: DateFormatter = DateFormatter(),sourceView: UIView, sourceRect: CGRect? = nil) {
        SBDropDown.showSBDatePicker(strTitle: strTitle, currentDate: currentDate, minDate: minDate, maxDate: maxDate, formatter: formatter, delegate: self, sourceView: sourceView, sourceRect: sourceRect ?? sourceView.bounds)
    }
    
} //extension


// MARK:- Extension for UIPopoverPresentationControllerDelegate
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
} //extension

