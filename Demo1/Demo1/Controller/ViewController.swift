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
    
    // MARK:- Variables
    let arrModel = ["Custom Object Array🧐", "Date & Time⏰"]
    
    private let strGitLink = "https://github.com/ShashikantBhadke/SBDropDown"
    private let strTwiLink = "https://twitter.com/Shashi_Bhadke"
    
    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    // MARK:- SetUpdata
    private func setUpView() {
        txtfContains.delegate = self
        txtfCreateDate.delegate = self
        
        SBDropDown.setUpDropDown()
    }
    // MARK:- Button Actions
    @IBAction private func bthGitLinkPressed(_ sender: UIButton) {
        openString(str: strGitLink)
    }
    @IBAction private func bthTwitterLinkPressed(_ sender: UIButton) {
        openString(str: strTwiLink)
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
