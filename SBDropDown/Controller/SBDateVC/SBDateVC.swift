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
} //protocol

public enum SBDateEnum {
    case Date, Time, DateTime
} //enum

internal class SBDateVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak public var viewSegment       : UIView!
    @IBOutlet weak public var segDateTime       : UISegmentedControl!
    @IBOutlet weak private var datePicker       : UIDatePicker!
    @IBOutlet weak private var lblSeperator     : UILabel!
    @IBOutlet weak public var btnSelect         : UIButton!
    @IBOutlet weak private var alWidthBtnSelect : NSLayoutConstraint! //180
    
    // MARK:- Variables
    var type:[SBDateEnum]               = [.Date, .Time]
    var date                            = Date()
    var dateMin                         : Date?
    var dateMax                         : Date?
    var arrData                         = [String]()
    weak var delegate                   : SBDateProtocol?
    var isShowSegment                   = true 
    var strSelectBtnTitle               = "Select" {
        didSet {
            if btnSelect != nil {
                btnSelect.setTitle(strSelectBtnTitle, for: .normal)
            }
        }
    }
    var strDateFormatter                = "dd-MM-yyyy" {
        didSet {
            if datePicker != nil {
                datePicker.datePickerMode = pickerMode
                getDateDayYear(givenDate: datePicker.date)
            }
        }
    }
    var strTimeFormatter                = "HH:MM"{
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
        if type.contains(.DateTime) {
            datePicker.datePickerMode = .dateAndTime
            segDateTime.removeSegment(at: 1, animated: true)
        } else if type.count == 1, type.contains(.Time) {
            datePicker.datePickerMode = .time
        }
        viewSegment.isHidden = !isShowSegment
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
    
    @IBAction private func btnSelectDateOptionPressed(sender: UISegmentedControl) {
        guard sender.numberOfSegments > 1 else { return }
        switch sender.selectedSegmentIndex {
        case 0:
            pickerMode = .date
        case 1:
            pickerMode = .time
        default:
            return
        }
    }
    
    // MARK:- Custom Methods
    public func getDateDayYear(givenDate: Date) {
        dateFormatter.dateFormat = strDateFormatter
        let strDate = dateFormatter.string(from: givenDate)
        arrData.append(strDate)
        segDateTime.setTitle(strDate, forSegmentAt: 0)
        if !type.contains(.DateTime) {
            if segDateTime.numberOfSegments > 1 {
                dateFormatter.dateFormat = strTimeFormatter
                let strTime = dateFormatter.string(from: givenDate)
                arrData.append(strTime)
                segDateTime.setTitle(strTime, forSegmentAt: 1)
            }
        } else if type.count == 1, type.contains(.Time) {
            dateFormatter.dateFormat = strTimeFormatter
            let strDate = dateFormatter.string(from: givenDate)
            arrData.append(strDate)
            segDateTime.setTitle(strDate, forSegmentAt: 0)
        }
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
