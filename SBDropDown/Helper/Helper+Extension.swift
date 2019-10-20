//
//  String+UILabel+Extension.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 8/9/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension for Bundle
public extension Bundle {
    @objc static func SBBundle() -> Bundle {
        let bundle = Bundle(for: SBTableVC.self)
        
        if let path = bundle.path(forResource: "SBDropDown", ofType: "bundle") {
            return Bundle(path: path)!
        } else {
            return bundle
        }
    }
} //extension

// MARK:- Extension for string
extension String {
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedString.Key.font: font]
        return self.size(withAttributes: fontAttributes)
    }
} //extension

// MARK:- Extension for string
extension UILabel {
    func widthOfText()-> CGFloat {
         return self.intrinsicContentSize.width
    }
} //extension

// MARK:- Extension for UIPopoverPresentationControllerDelegate
extension UIViewController: UIPopoverPresentationControllerDelegate {
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
} //extension
