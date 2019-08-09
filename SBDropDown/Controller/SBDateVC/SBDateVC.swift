//
//  SBDateVC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 8/9/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

public protocol SBDateProtocol: class {
    func didSBDateValueChanged(date: Date)
    func btnSBSelectPressed(date: Date)
    func btnSBSelectDateOption(type: SBDateEnum)
} //protocol

public enum SBDateEnum {
    case Date, Time
} //enum


internal class SBDateVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak public var btnSelect         : UIButton!
    @IBOutlet weak public var btnDate           : UIButton!
    @IBOutlet weak public var btnTime           : UIButton!
    @IBOutlet weak private var datePicker       : UIDatePicker!
    @IBOutlet weak private var lblSeperator     : UILabel!
    @IBOutlet weak private var alWidthBtnSelect : NSLayoutConstraint! //180
    
    // MARK:- Variables
    var date                            = Date()
    var dateMin                         : Date?
    var dateMax                         : Date?
    var arrData                         = [String]()
    weak var delegate                   : SBDateProtocol?
    var strDateFormatter                = "dd-MM-yyyy" {
        didSet {
            if datePicker != nil {
                datePicker.datePickerMode = pickerMode
                getDateDayYear(givenDate: datePicker.date)
            }
        }
    }
    var strTimeFormatter                = "HH:mm a"{
        didSet {
            if datePicker != nil {
                datePicker.datePickerMode = pickerMode
                getDateDayYear(givenDate: datePicker.date)
            }
        }
    }
    
    var pickerMode: UIDatePicker.Mode   = .date {
        didSet {
            if datePicker != nil {
                datePicker.datePickerMode = pickerMode
                getDateDayYear(givenDate: datePicker.date)
            }
        }
    }
    
    private var dateFormatter           = DateFormatter()
    
    // MARK:- ViewLifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDateDayYear(givenDate: date)
    }
    
    // MARK:- SetUpView
    private func setUpView() {
        datePicker.minimumDate = dateMin
        datePicker.maximumDate = dateMax
        datePicker.datePickerMode = pickerMode
    }
    
    // MARK:- Picker & Button Actions
    @IBAction private func datePickerValueChanged(sender: UIDatePicker) {
        getDateDayYear(givenDate: sender.date)
        delegate?.didSBDateValueChanged(date: sender.date)
    }
    
    @IBAction private func btnSelectPressed(sender: UIButton) {
        delegate?.btnSBSelectPressed(date: datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction private func btnSelectDateOptionPressed(sender: UIButton) {
        switch sender {
        case btnDate:
            delegate?.btnSBSelectDateOption(type: .Date)
        case btnTime:
            delegate?.btnSBSelectDateOption(type: .Time)
        default:
            return
        }
    }
    
    // MARK:- Custom Methods
    public func getDateDayYear(givenDate: Date) {
        dateFormatter.dateFormat = strDateFormatter
        let strDate = dateFormatter.string(from: givenDate)
        arrData.append(strDate)
        btnDate.setTitle(strDate, for: .normal)
        
        dateFormatter.dateFormat = strTimeFormatter
        let strTime = dateFormatter.string(from: givenDate)
        arrData.append(strTime)
        btnTime.setTitle(strTime, for: .normal)
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
