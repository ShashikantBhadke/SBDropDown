//
//  SBDropDownC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

internal protocol SBPopOverDimiss: class {
    func popOverIsDismissed()
}

public class SBDropDown {
    
    // MARK: Initializer
    static public var shared = SBDropDown()
    private init() {}
    
    // MARK: Variables
    /// DropDown Methods
    public var sourceView                   : UIView?
    public var sourceRect                   : CGRect?
    public var arrowDirection               : UIPopoverArrowDirection = .any
    internal var sbTableVC                  : SBTableVC?
    internal var sbDateVC                   : SBDateVC?
    
    /// TableView Methods
    public var strSelectBtnTitle: String = "Select"
    public var heightForRow: CGFloat        = 50.0
    public var isShowSelectButton           = true
    public var isReloadAfterSelection       = true
    public var isClearOnDoubleTab           = true
    public var isMultiSelect                = true
    public var isClearData                  = false
    public var isDismissOnSelection         = false
    public var cgSelectButtonWidth: CGFloat = 180
    public var cgDateSegmentWidth: CGFloat  = 200
    public var imgSelected                  : UIImage?
    public var imgDeSelected                : UIImage?
    public var selectBtnColor               = UIColor.blue
    public var selectBGBtnColor             = UIColor.white
    
    /// DatePicker Methods
    public var isShowSegment                   = true
    public var strDateFormatter                = "dd-MM-yyyy"
    public var strTimeFormatter                = "hh:mm a"
    public var pickerMode: UIDatePicker.Mode   = .date
    public var segTintColor                    = UIColor.blue
    public var segBackColor                    = UIColor.white
    public var segTextColor                    = UIColor.blue
    public var segTextSelectedColor            = UIColor.white
    
    // MARK: Internal Methods
    private func presentController(strTitle: String, vc: UIViewController, delegate: UIViewController) {
        let navigationController = UINavigationController(rootViewController: vc)
        
        vc.navigationItem.title = strTitle
        navigationController.modalPresentationStyle = .popover
        
        if let presentationController = navigationController.popoverPresentationController {
            presentationController.delegate = delegate
            presentationController.permittedArrowDirections = arrowDirection
            presentationController.sourceView = sourceView
            presentationController.sourceRect = sourceRect ?? sourceView?.bounds ?? CGRect(x: delegate.view.center.x, y: delegate.view.center.y, width: 180, height: 200)
        }
        delegate.present(navigationController, animated: true, completion: nil)
    }
    
    private func showActionSheet(strTitle: String, _view: UIView, delegate: UIViewController) {
        let actionSheet = UIAlertController(title: strTitle, message: "", preferredStyle: .actionSheet)
        actionSheet.view.addSubview(_view)
        _view.translatesAutoresizingMaskIntoConstraints = false
        _view.topAnchor.constraint(equalTo: actionSheet.view.topAnchor, constant: 50).isActive = true
        _view.rightAnchor.constraint(equalTo: actionSheet.view.rightAnchor, constant: -10).isActive = true
        _view.leftAnchor.constraint(equalTo: actionSheet.view.leftAnchor, constant: 10).isActive = true
        _view.heightAnchor.constraint(equalToConstant: 250).isActive = true
        actionSheet.view.translatesAutoresizingMaskIntoConstraints = false
        actionSheet.view.heightAnchor.constraint(equalToConstant: 370).isActive = true
         actionSheet.view.addSubview(_view)
        let selectAction = UIAlertAction(title: self.strSelectBtnTitle, style: .cancel) { [weak self](_ ) in
            guard let strongSelf = self else { return }
            strongSelf.sbDateVC?.delegate?.btnSBSelectPressed(date: strongSelf.sbDateVC?.datePicker.date ?? Date(), key: strongSelf.sbDateVC?.key)
        }
        actionSheet.addAction(selectAction)
        delegate.present(actionSheet, animated: true, completion: nil)
    }
    
    // MARK: Public Methods
    /**
     - parameters:
        - type: 0 - TableView, 1 - DateView else Both
     */
    public func setUpDropDown(_ type: Int = 2) {
        switch type {
        case 0:
            sbTableVC = nil
            
            let bundleTable = Bundle(for: SBTableVC.self)
            sbTableVC = SBTableVC(nibName: String(describing: SBTableVC.self), bundle: bundleTable)
        case 1:
            sbDateVC = nil
            
            let bundleDate = Bundle(for: SBDateVC.self)
            sbDateVC = SBDateVC(nibName: String(describing: SBDateVC.self), bundle: bundleDate)
        default:
            sbTableVC = nil
            sbDateVC = nil
            
            let bundleTable = Bundle(for: SBTableVC.self)
            sbTableVC = SBTableVC(nibName: String(describing: SBTableVC.self), bundle: bundleTable)
            
            let bundleDate = Bundle(for: SBDateVC.self)
            sbDateVC = SBDateVC(nibName: String(describing: SBDateVC.self), bundle: bundleDate)
        }
    }
    
    public func showSBDropDown(strTitle: String, delegate: UIViewController, arrSelectedIndex: [Int], arrElements: [Any], sourceView: UIView? = nil, sourceRect: CGRect? = nil, key: Any?) {
        
        setUpDropDown(0)
        
        self.sourceView = sourceView
        self.sourceRect = sourceRect
        guard let dropDownVC = sbTableVC else {
            debugPrint("---❌ Error while getting SBTableVC ❌---")
            return
        }
        dropDownVC.key                      = key
        dropDownVC.arrElement               = arrElements
        dropDownVC.imgSelected              = imgSelected
        dropDownVC.heightForRow             = heightForRow
        dropDownVC.isMultiSelect            = isMultiSelect
        dropDownVC.imgDeSelected            = imgDeSelected
        dropDownVC.selectBtnColor           = selectBtnColor
        dropDownVC.selectBGBtnColor         = selectBGBtnColor
        dropDownVC.arrSelectedIndex         = arrSelectedIndex
        dropDownVC.strSelectBtnTitle        = strSelectBtnTitle
        dropDownVC.isClearOnDoubleTab       = isClearOnDoubleTab
        dropDownVC.isShowSelectButton       = isShowSelectButton
        dropDownVC.cgButtonWidth            = cgSelectButtonWidth
        dropDownVC.isDismissOnSelection     = isDismissOnSelection
        dropDownVC.isReloadAfterSelection   = isReloadAfterSelection
        
        dropDownVC.delegate                 = delegate as? SBTableProtocol
        
        dropDownVC.sbDelegete = self
        
        if let customSize = sourceRect?.size {
            dropDownVC.preferredContentSize = customSize
        }
        
        presentController(strTitle: strTitle, vc: dropDownVC, delegate: delegate)
    }
    
    public func showSBDatePicker(strTitle: String, currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, delegate: UIViewController, sourceView: UIView? = nil, sourceRect: CGRect? = nil, type: [SBDateEnum] = [.Date, .Time], key: Any?) {
        
        setUpDropDown(1)
        
        self.sourceView = sourceView
        self.sourceRect = sourceRect
        guard let dropDownVC = sbDateVC else {
            debugPrint("---❌ Error while getting SBDateVC ❌---")
            return
        }
        dropDownVC.key                      = key
        dropDownVC.type                     = type
        dropDownVC.dateMax                  = maxDate
        dropDownVC.dateMin                  = minDate
        dropDownVC.pickerMode               = pickerMode
        dropDownVC.date                     = currentDate
        dropDownVC.segTintColor             = segTintColor
        dropDownVC.segTextColor             = segTextColor
        dropDownVC.segBackColor             = segBackColor
        dropDownVC.isShowSegment            = isShowSegment
        dropDownVC.strSelectBtnTitle        = strSelectBtnTitle
        dropDownVC.strDateFormatter         = strDateFormatter
        dropDownVC.strTimeFormatter         = strTimeFormatter
        dropDownVC.cgButtonWidth            = cgSelectButtonWidth
        dropDownVC.cgSegmentWidth           = cgDateSegmentWidth
        dropDownVC.segTextSelectedColor     = segTextSelectedColor
        
        if let customSize = sourceRect?.size {
            dropDownVC.preferredContentSize = customSize
        }
        dropDownVC.delegate = delegate as? SBDateProtocol
        dropDownVC.sbDelegete = self
        
        presentController(strTitle: strTitle, vc: dropDownVC, delegate: delegate)
    }
    
    public func showSBActionDatePicker(strTitle: String, currentDate: Date = Date(), minDate: Date? = nil, maxDate: Date? = nil, delegate: UIViewController, type: [SBDateEnum] = [.Date, .Time], key: Any?) {
        
        setUpDropDown(1)
        
        guard let dropDownVC = sbDateVC else {
            debugPrint("---❌ Error while getting SBDateVC ❌---")
            return
        }
        dropDownVC.key                      = key
        dropDownVC.type                     = type
        dropDownVC.dateMax                  = maxDate
        dropDownVC.dateMin                  = minDate
        dropDownVC.pickerMode               = pickerMode
        dropDownVC.date                     = currentDate
        dropDownVC.segTintColor             = segTintColor
        dropDownVC.segTextColor             = segTextColor
        dropDownVC.segBackColor             = segBackColor
        dropDownVC.isShowSegment            = isShowSegment
        dropDownVC.strSelectBtnTitle        = strSelectBtnTitle
        dropDownVC.strDateFormatter         = strDateFormatter
        dropDownVC.strTimeFormatter         = strTimeFormatter
        dropDownVC.cgButtonWidth            = cgSelectButtonWidth
        dropDownVC.cgSegmentWidth           = cgDateSegmentWidth
        dropDownVC.segTextSelectedColor     = segTextSelectedColor
        dropDownVC.delegate = delegate as? SBDateProtocol
        dropDownVC.sbDelegete = self
        dropDownVC.isShowSelectBtn = false
        showActionSheet(strTitle: strTitle, _view: dropDownVC.view, delegate: delegate)
    }
} // class


// MARK :- Extensio For - SBPopOverDimiss
extension SBDropDown: SBPopOverDimiss {
    func popOverIsDismissed() {
        sbDateVC = nil
        sbTableVC = nil
    }
} //extension
