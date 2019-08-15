//
//  String+UILabel+Extension.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 8/9/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit
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
