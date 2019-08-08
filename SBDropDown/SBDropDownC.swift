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
    static public var isSingleReference     = true
    static public var sourceView            : UIView?
    static public var sourceRect            : CGRect?
    static public var arrowDirection        : UIPopoverArrowDirection = .any
    
    static public var sbTableVC: SBTableVC?
    
    // MARK: Internal Methods
    private class func presentController(strTitle: String, vc: SBTableVC, delegate: UIViewController) {
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
        if !isSingleReference || sbTableVC == nil  {
            let bundle = Bundle(for: SBTableVC.self)
            sbTableVC = SBTableVC(nibName: String(describing: SBTableVC.self), bundle: bundle)
        }
    }
    
    public class func showSBDropDown(strTitle: String, delegate: UIViewController, arrSelectedIndex: [Int], arrElements: [Any], sourceView: UIView? = nil, sourceRect: CGRect? = nil, key: Any?) {
        
        self.sourceView = sourceView
        self.sourceRect = sourceRect ?? sourceView?.bounds
        guard let dropDownVC = sbTableVC else {
            debugPrint("---❌ Error while getting SBTableVC ❌---")
            return
        }
        dropDownVC.delegate = delegate as? SBProtocol
        dropDownVC.arrElement = arrElements
        dropDownVC.arrSelectedIndex = arrSelectedIndex
        dropDownVC.key = key
        presentController(strTitle: strTitle, vc: dropDownVC, delegate: delegate)
    }
} // class

