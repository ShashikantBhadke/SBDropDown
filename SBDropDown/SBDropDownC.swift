//
//  SBDropDownC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

public class SBDropDown {
    
    // MARK: Variables
    /// DropDown Methods
    static public var isSingleReference     = true
    static public var sourceView            : UIView?
    static public var sourceRect            : CGRect?
    static public var arrowDirection        : UIPopoverArrowDirection = .any
    static public var strSelectBtnTitleDropDown: String = "Select" {
        didSet {
            sbTableVC?.strSelectBtnTitle = strSelectBtnTitlePicker
        }
    }
    static public var strSelectBtnTitlePicker: String = "Select" {
        didSet {
            sbDateVC?.strSelectBtnTitle = strSelectBtnTitlePicker
        }
    }
    
    /// TableView Methods
    static public var heightForRow: CGFloat    = 50.0 {
        didSet {
            sbTableVC?.heightForRow = heightForRow
        }
    }
    static public var isShowSelectButton       = true {
        didSet {
            sbTableVC?.isShowSelectButton = isShowSelectButton
        }
    }
    static public var isReloadAfterSelection   = true {
        didSet {
            sbTableVC?.isReloadAfterSelection = isReloadAfterSelection
        }
    }
    static public var isClearOnDoubleTab       = true {
        didSet {
            sbTableVC?.isClearOnDoubleTab = isClearOnDoubleTab
        }
    }
    static public var isMultiSelect            = true {
        didSet {
            sbTableVC?.isMultiSelect = isMultiSelect
        }
    }
    static public var isClearData              = false {
        didSet {
            sbTableVC?.isClearData = isClearData
        }
    }
    static public var isDismissOnSelection     = false {
        didSet {
            sbTableVC?.isDismissOnSelection = isDismissOnSelection
        }
    }    
    static public var isShowSegment                   = true {
        didSet {
            sbDateVC?.isShowSegment = isShowSegment
        }
    }
    /// DatePicker Methods
    static public var strDateFormatter      = "" {
        didSet {
            sbDateVC?.strDateFormatter = strDateFormatter
        }
    }
    static public var strTimeFormatter      = "" {
        didSet {
            sbDateVC?.strTimeFormatter = strTimeFormatter
        }
    }
    static public var pickerMode: UIDatePicker.Mode   = .date {
        didSet {
            sbDateVC?.pickerMode = pickerMode
        }
    }
    static internal var sbTableVC: SBTableVC?
    static internal var sbDateVC: SBDateVC?
    
    // MARK: Internal Methods
    private class func presentController(strTitle: String, vc: UIViewController, delegate: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        
        vc.navigationItem.title = strTitle
        navigationController.modalPresentationStyle = .popover
        
        if let presentationController = navigationController.popoverPresentationController {
            presentationController.delegate = delegate
            presentationController.permittedArrowDirections = arrowDirection
            presentationController.sourceView = sourceView
            presentationController.sourceRect = sourceRect ?? CGRect(x: delegate.view.center.x, y: delegate.view.center.y, width: 230, height: 250)
        }
        delegate.present(navigationController, animated: true, completion: nil)
    }
    
    // MARK: Public Methods
    public class func setUpDropDown() {
        if !isSingleReference || sbTableVC == nil || sbDateVC == nil {
            let bundle = Bundle(for: SBTableVC.self)
            sbTableVC = SBTableVC(nibName: String(describing: SBTableVC.self), bundle: bundle)
            sbDateVC = SBDateVC(nibName: String(describing: SBDateVC.self), bundle: bundle)
        }
    }
    
    public class func showSBDropDown(strTitle: String, delegate: UIViewController, arrSelectedIndex: [Int], arrElements: [Any], sourceView: UIView? = nil, sourceRect: CGRect? = nil, key: Any?) {
        
        self.sourceView = sourceView
        self.sourceRect = sourceRect ?? sourceView?.bounds
        guard let dropDownVC = sbTableVC else {
            debugPrint("---❌ Error while getting SBTableVC ❌---")
            return
        }
        dropDownVC.delegate = delegate as? SBTableProtocol
        dropDownVC.arrElement = arrElements
        dropDownVC.arrSelectedIndex = arrSelectedIndex
        dropDownVC.key = key
        presentController(strTitle: strTitle, vc: dropDownVC, delegate: delegate)
    }
    
    public class func showSBDatePicker(strTitle: String, currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, delegate: UIViewController, sourceView: UIView? = nil, sourceRect: CGRect? = nil, type: [SBDateEnum] = [.Date, .Time]) {
        
        self.sourceView = sourceView
        self.sourceRect = sourceRect ?? sourceView?.bounds
        guard let dropDownVC = sbDateVC else {
            debugPrint("---❌ Error while getting SBDateVC ❌---")
            return
        }
        dropDownVC.type = type
        dropDownVC.date = currentDate
        dropDownVC.dateMax = maxDate
        dropDownVC.dateMin = minDate
        dropDownVC.delegate = delegate as? SBDateProtocol
        presentController(strTitle: strTitle, vc: dropDownVC, delegate: delegate)
    }
} // class

