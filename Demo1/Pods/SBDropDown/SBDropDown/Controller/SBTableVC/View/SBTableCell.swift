//
//  TableViewCell.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

public class SBTableCell: UITableViewCell {

    // MARK:- Outlets
    @IBOutlet public weak var imgvCheckMark            : UIImageView!
    @IBOutlet public weak var lblTitle                 : UILabel!
    
    // MARK:- Variables
    public var imgSelected : UIImage?
    public var imgDeSelected : UIImage?
    
    // MARK:- Default Methods
    override public func awakeFromNib() {
        super.awakeFromNib()        
        isSelected(false)
    }
    public override func prepareForReuse() {
        lblTitle.text = ""
        imgvCheckMark.image = nil
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func isSelected(_ status: Bool) {
        imgvCheckMark.image = status ? imgSelected : imgDeSelected
    }
    
} // class
