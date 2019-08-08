//
//  SBTableVC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

public protocol SBProtocol: class {
    func configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?)
    func didSelectCell(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, key: Any?)
    func btnSelectSBProtocolPressed(arrSelectedIndex: [Int], arrElements: [Any], key: Any?)
} //protocol


public class SBTableVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak public var btnSelect     : UIButton!
    @IBOutlet weak private var tableView    : UITableView!
    @IBOutlet weak private var lblSeperator : UILabel!
    
    // MARK:- Variables
    /// Public Variables
    public var key                      : Any?
    public var arrElement               = [Any]()
    public var heightForRow: CGFloat    = 50.0
    public var isShowSelectButton       = true
    public var isReloadAfterSelection   = true
    public var isClearOnDoubleTab       = true
    public var arrSelectedIndex         = [Int]()
    public var isMultiSelect            = true
    public var isClearData              = false
    public var isDismissOnSelection     = false

    /// Internal Variables
    weak var delegate                   : SBProtocol?
    
    /// Private Variables
    private var isReloadNeeded          = false
    
    // MARK:- ViewLifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if isClearData {
            clearSelection()
        }
        
        if isMultiSelect {
            isClearOnDoubleTab = isMultiSelect
            isDismissOnSelection = !isMultiSelect
        }
        
        if isReloadNeeded {
            isReloadNeeded.toggle()
            self.tableView.reloadData()
        }
    }
    
    public override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        isReloadNeeded.toggle()
    }
    // MARK:- SetUpView
    private func setUpView() {
        setUpCell()
        tableView.delegate      = self
        tableView.dataSource    = self
        tableView.tableFooterView = UIView()
        
        lblSeperator.isHidden = isDismissOnSelection
        btnSelect.isHidden = isDismissOnSelection
        
    }
    private func setUpCell() {
        let bundle = Bundle(for: SBTableVC.self)
        let cellNib = UINib.init(nibName: String(describing: SBTableCell.self), bundle: bundle)
        tableView.register(cellNib, forCellReuseIdentifier: String(describing: SBTableCell.self))
    }
    
    // MARK:- Button Actions
    @IBAction private func btnSelectPressed(_ sender: UIButton) {
        delegate?.btnSelectSBProtocolPressed(arrSelectedIndex: arrSelectedIndex, arrElements: arrElement, key: key)
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
        debugPrint("\(String(describing: self)) controller removed...")
    }
} //class
