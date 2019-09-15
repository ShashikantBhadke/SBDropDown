//
//  SBTableVC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

@objc public protocol SBTableProtocol: class {
    @objc optional func configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?)
    @objc optional func didSelectCell(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, key: Any?)
    @objc optional func btnSelectSBProtocolPressed(arrSelectedIndex: [Int], arrElements: [Any], key: Any?)
} //protocol

internal class SBTableVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak private var btnSelect            : UIButton!
    @IBOutlet weak private var viewBtnSelect        : UIView!
    @IBOutlet weak private var tableView            : UITableView!
    @IBOutlet weak private var lblSeperator         : UILabel!
    @IBOutlet weak private var alWidthBtnSelect     : NSLayoutConstraint!
    
    // MARK:- Variables
    /// Public Variables
    var key                      : Any?
    var arrElement               = [Any]()
    var arrSelectedIndex         = [Int]()
    
    var strSelectBtnTitle        = "Select"
    var heightForRow: CGFloat    = 50.0
    var isShowSelectButton       = true
    var isReloadAfterSelection   = true
    var isClearOnDoubleTab       = true
    var isMultiSelect            = true
    var isDismissOnSelection     = false
    var cgButtonWidth: CGFloat   = 180
    var imgSelected              : UIImage?
    var imgDeSelected            : UIImage?
    var selectBtnColor           = UIColor.blue
    var selectBGBtnColor         = UIColor.white
    
    /// Internal Variables
    weak var delegate            : SBTableProtocol?
    weak var sbDelegete          : SBPopOverDimiss?
    
    /// Private Variables
    internal var isArrayOfString  = false
    
    // MARK:- ViewLifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
        btnSelect.setTitle(strSelectBtnTitle, for: .normal)
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sbDelegete?.popOverIsDismissed()
    }
    // MARK:- SetUpView
    private func setUpView() {
        if ((arrElement as? [String]) != nil) {
            isArrayOfString = true
        }
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.tableFooterView = UIView()
        btnSelect.setTitleColor(selectBtnColor, for: .normal)
        btnSelect.backgroundColor = selectBGBtnColor
        viewBtnSelect.isHidden = !isShowSelectButton
        lblSeperator.isHidden = !isShowSelectButton        
        alWidthBtnSelect.constant = cgButtonWidth
    }
    
    private func setUpCell() {
        let bundle = Bundle(for: SBTableVC.self)
        let cellNib = UINib.init(nibName: String(describing: SBTableCell.self), bundle: bundle)
        tableView.register(cellNib, forCellReuseIdentifier: String(describing: SBTableCell.self))
    }
    
    // MARK:- Button Actions
    @IBAction private func btnSelectPressed(_ sender: UIButton) {
        delegate?.btnSelectSBProtocolPressed?(arrSelectedIndex: arrSelectedIndex, arrElements: arrElement, key: key)
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK:- Custom Methods
    private func clearSelection() {
        arrSelectedIndex.removeAll()
        self.tableView.reloadData()
    }
    
    // MARK:- Receive Memory Warning
    override public func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        debugPrint("Receive Memory Warning in \(String(describing: self))")
    }
    
    // MARK:- Deinit
    deinit {
        tableView.removeFromSuperview()
        tableView = nil
        debugPrint("\(String(describing: self)) controller removed...")
    }
} //class
