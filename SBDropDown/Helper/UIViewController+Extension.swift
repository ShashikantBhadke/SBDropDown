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
    
    func showSBDropDown(strTitle: String = "Select Value", arrSelectedIndex: [Int] = [], arrElemets: [Any], sourceView: UIView, sourceRect: CGRect? = nil, key: Any? = nil) {
        SBDropDown.shared.showSBDropDown(strTitle: strTitle, delegate: self, arrSelectedIndex: arrSelectedIndex, arrElements: arrElemets, sourceView: sourceView, sourceRect: sourceRect, key: key)
    }
    
    func showSBDatePicker(strTitle: String = "Select Date", currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, sourceView: UIView, sourceRect: CGRect? = nil, type: [SBDateEnum] = [.Date, .Time], key: Any? = nil) {
        SBDropDown.shared.showSBDatePicker(strTitle: strTitle, currentDate: currentDate, minDate: minDate, maxDate: maxDate, delegate: self, sourceView: sourceView, sourceRect: sourceRect, type: type, key: key)
    }
    /// Note below methods is not work for ipad...😒😞
    func showSBActionDatePicker(strTitle: String = "Select Date", currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, sourceView: UIView, sourceRect: CGRect? = nil, type: [SBDateEnum] = [.Date, .Time], key: Any? = nil) {
        SBDropDown.shared.showSBActionDatePicker(strTitle: strTitle, currentDate: currentDate, minDate: minDate, maxDate: maxDate, delegate: self, sourceView: sourceView, sourceRect: sourceRect, type: type, key: key)
    }
} //extension


// MARK:- Extension for UIPopoverPresentationControllerDelegate
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
} //extension
