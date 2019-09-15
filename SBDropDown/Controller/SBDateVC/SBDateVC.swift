//
//  SBDateVC.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 8/9/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

@objc public protocol SBDateProtocol: class {
    @objc optional func didSBDateValueChanged(date: Date, key: Any?)
    @objc optional func btnSBSelectPressed(date: Date, key: Any?)
} //protocol

public enum SBDateEnum {
    case Date, Time, DateTime
} //enum

internal class SBDateVC: UIViewController {
    
    // MARK:- Outlets
    @IBOutlet weak public var datePicker            : UIDatePicker!
    @IBOutlet weak public var viewSegment           : UIView!
    @IBOutlet weak public var viewSelectBtn         : UIView!
    @IBOutlet weak public var segDateTime           : UISegmentedControl!
    @IBOutlet weak public var btnSelect             : UIButton!
    @IBOutlet weak private var lblSeperator         : UILabel!
    @IBOutlet weak private var alWidthBtnSelect     : NSLayoutConstraint! //180
    @IBOutlet weak private var alWidthSegment       : NSLayoutConstraint! //100
    
    // MARK:- Variables
    var cgButtonWidth: CGFloat          = 180
    var cgSegmentWidth: CGFloat         = 200
    var isShowSegment                   = true
    var isShowSelectBtn                 = true
    var pickerMode: UIDatePicker.Mode   = .date
    var dateMin                         : Date?
    var dateMax                         : Date?
    var date                            = Date()
    var key                             : Any?
    var strSelectBtnTitle               = "Select"
    var strTimeFormatter                = "hh:mm a"
    var arrData                         = [String]()
    var strDateFormatter                = "dd-MM-yyyy"
    var segTintColor                    = UIColor.blue
    var segTextSelectedColor            = UIColor.white
    var segBackColor                    = UIColor.blue
    var segTextColor                    = UIColor.white
    var type:[SBDateEnum]               = [.Date, .Time]
    private var dateFormatter           = DateFormatter()
    weak var delegate                   : SBDateProtocol?
    weak var sbDelegete                 : SBPopOverDimiss?
    
    // MARK:- ViewLifeCycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDateDayYear(givenDate: date)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        sbDelegete?.popOverIsDismissed()
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
        viewSelectBtn.isHidden = !isShowSelectBtn
        lblSeperator.isHidden = !isShowSelectBtn
        
        segDateTime.tintColor = segTintColor
        segDateTime.backgroundColor = segBackColor
        segDateTime.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: segTextColor], for: .normal)
        segDateTime.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: segTextSelectedColor], for: .selected)
        
        alWidthBtnSelect.constant = cgButtonWidth
        alWidthSegment.constant = cgSegmentWidth
        
        btnSelect.setTitle(strSelectBtnTitle, for: .normal)
    }
    
    // MARK:- Picker & Button Actions
    @IBAction private func datePickerValueChanged(sender: UIDatePicker) {
        delegate?.didSBDateValueChanged?(date: sender.date, key: key)
        getDateDayYear(givenDate: sender.date)
    }
    
    @IBAction private func btnSelectPressed(sender: UIButton) {
        delegate?.btnSBSelectPressed?(date: datePicker.date, key: key)
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
        datePicker.datePickerMode = pickerMode
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
