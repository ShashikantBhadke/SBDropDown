//
//  ViewController.swift
//  Demo1
//
//  Created by Shashikant Bhadke on 11/08/19.
//  Copyright © 2019 Shashikant Bhadke. All rights reserved.
//

import UIKit
import SBDropDown

class ViewController: UITableViewController {
    // MARK:- Outlets
    @IBOutlet weak private var imgvProfile  : UIImageView!
    @IBOutlet weak var txtfCreateDate       : UITextField!
    @IBOutlet weak var txtfContains         : UITextField!
    @IBOutlet weak var txtfContains1        : UITextField!
    
    // MARK:- Variables
    var isCallSetUP = true
    var intSelected: Int?
    let arrModel = ["Custom Object Array🧐", "Date & Time⏰"]
    
    private let strGitLink = "https://github.com/ShashikantBhadke/SBDropDown"
    private let strTwiLink = "https://twitter.com/Shashi_Bhadke"
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpNavigation()
    }
    
    // MARK:- SetUpdata
    private func setUpView() {
        txtfContains.delegate = self
        txtfContains1.delegate = self
        txtfCreateDate.delegate = self
        SBDropDown.shared.imgSelected = #imageLiteral(resourceName: "correct")
    }
    private func setUpNavigation() {
        let rightBar = UIBarButtonItem(image: #imageLiteral(resourceName: "icon_Menu"), style: .plain, target: self, action: #selector(btnNavigationBtnPressed(_ :)))
        self.navigationItem.rightBarButtonItem = rightBar
    }
    
    // MARK:- Button Actions
    @IBAction private func bthGitLinkPressed(_ sender: UIButton) {
        openString(str: strGitLink)
    }
    @IBAction private func bthTwitterLinkPressed(_ sender: UIButton) {
        openString(str: strTwiLink)
    }
    
    @objc private func btnNavigationBtnPressed(_ sender: UIBarButtonItem) {
        guard let _view = sender.value(forKey: "view") as? UIView else { return }
        var arrSelectedIndex = [Int]()
        if let _intIndex = self.intSelected {
            arrSelectedIndex = [_intIndex]
        }
        self.showSBDropDown(strTitle: "Select Value", arrSelectedIndex: arrSelectedIndex, arrElemets: arrModel,sourceView: _view)
    }
    
    // MARK:- Custom Methods
    private func openString(str: String) {
        guard let url = URL(string: str) else { return }
        UIApplication.shared.open(url)
    }
    
    // MARK:- Did Receive Memory Warning
    override func didReceiveMemoryWarning() {
        debugPrint("Did received memory warning - " + String(describing: self))
    }
    
    // MARK:- Deinit
    deinit {
        debugPrint("Controller removed - " + String(describing: self))
    }
} //class
