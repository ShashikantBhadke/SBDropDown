# SBDropDown
[![Build Status](https://travis-ci.org/ShashikantBhadke/SBDropDown.svg?branch=master)](https://travis-ci.org/ShashikantBhadke/SBDropDown)
[![License](https://img.shields.io/cocoapods/l/SBDropDown.svg?style=flat)](http://cocoapods.org/pods/SBDropDown)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SBDropDown.svg)](http://cocoapods.org/pods/SBDropDown)
![Platform](https://img.shields.io/cocoapods/p/SBDropDown.svg?style=flat)
![Open Source Helpers](https://www.codetriage.com/shashikantbhadke/sbdropdown/badges/users.svg)


Simple dropDown for date and _ array.
     
![Sample1](https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/Screenshot%202019-08-20%20at%2011.20.24%20PM.png)
[Video Sample](https://youtu.be/vGMET0_PnT0)

- [Documentation](#Documentation)
- [Requirements](#Requirements)
- [Installation](#Installation)


## Documentation

[Usage Video Link](https://youtu.be/8LJ9ktKGfDM)

### Custom Text DropDown

1) To show DropDown with respect with to ``` sourceView ``` and ``` sourceRect ```  *(optional)* 

``` 
    let strTitle = "My Title"
    let arrEmements = ["Value 1", "Value 2", "Value 3"] 
    self.showSBDropDown(strTitle: strTitle, arrSelectedIndex: [2], arrElemets: arrEmements, sourceView: sender, key: "myKey")
```
where,
- strTitle :- Is the title of dropDown list.
- arrElemets :- Array of you normal or complicated model.
- arrSelectedIndex :- Array of your selected indices if any else set `[]`.
- sourceView :- DropDown arrow is pointing to this view and you haven't provided  `sourceRect` then `sourceView.bounds` is used instead of this
- key :- Extra key if that you may want it for differentiate from others

2) After this you have to define delegate methods for ``` SBProtocol ``` which are already confirmed at start.
```
    configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?)
```
*If you provide array of string then no need to set this. I have done your work for that😅.*
where,
- currentIndex :- As name say's it is current Index 😜
-  arrSelectedIndex :- As this framework is also support for multi selection. So that it that it has multiple selected indices.
- currentData :- Object that you are using to set on dropDrown. 
- cell :-  Table view cell of class ``` SBTableCell ```  is for data set with you custom check mark icon and to change alignment of lable.
- key :- Extra key if that you may want it for differentiate from others

For Example,

``` 
    // MARK:- Extension for SBTableProtocol
    extension ViewController: SBTableProtocol {
        func configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?) {
            guard isCallSetUP else { return }
            if let str = currentData as? String {
                cell.lblTitle.text = str
                cell.imgSelected = #imageLiteral(resourceName: "correct")
                cell.isSelected(arrSelectedIndex.contains(currentIndex))
            }
            
            if let clr = currentData as? UIColor {
                cell.lblTitle.backgroundColor = clr
                cell.lblTitle.text = ""
                cell.imgSelected = #imageLiteral(resourceName: "correct")
                cell.isSelected(arrSelectedIndex.contains(currentIndex))
            }
        }
        
     ....
     
    } //extension
```

Now the second method is
```
    didSelectCell(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, key: Any?)
```
where,
- currentIndex :- As name say's it is current Index 😜
-  arrSelectedIndex :- As this framework is also support for multi selection. So that it that it has multiple selected indices.
- currentData :- Object that you are using to set on dropDrown. 
- key :- Extra key if that you may want it for differentiate from others

    This methods is called when user tap on any dropDown list this method is triggerd same like table view didSelect methods 

And the last dropDown delegate methods is 
```
    btnSelectSBProtocolPressed(arrSelectedIndex: [Int], arrElements: [Any], key: Any?)
```
where,
-  arrSelectedIndex :- As this framework is also support for multi selection. So that it that it has multiple selected indices.
- arrElemets :- Array of you normal or complicated model which you send at start.
- key :- Extra key if that you may want it for differentiate from others

    This methods is called when user tap's on select button.


3) *(Optional)* Drop down Arrow Direction  
    You can change drop down arrow direction as below,
``` 
    SBDropDown.shared.arrowDirection = .down
```
or
       
``` 
    SBDropDown.shared.arrowDirection = [.up, .down]
```

4)  *(Optional)* Select Button Properties...  
To show or hide` SBDropDown.shared.isShowSelectButton = true // false`.
To change titile` SBDropDown.shared.strSelectBtnTitle = "My New Title"`. 
To change width ` SBDropDown.shared.cgSelectButtonWidth = 180`.
To change or title color` SBDropDown.shared.selectBtnColor = UIColor.blue`.
To change or background color` SBDropDown.shared.selectBGBtnColor = UIColor.white`.

5) Selecetion type (Default is `Multi Selection`):
To change this you need to set ` SBDropDown.shared.isMultiSelect = true // false `
    
6) To disable on double tap set ```SBDropDown.shared.isClearOnDoubleTab = false```

### Date & Time DropDown

1) And you are ready to use it date and time drop down as below,
```
    self.showDatePicker(sourceView: sender)
```
or
```
    self.showSBDatePicker(strTitle: "Select DOB", currentDate: Date(), minDate: nil, maxDate: nil, sourceView: sender, sourceRect: sender.bounds)
```
2) You can also modify time and date format that show on dropDown segment... like
```
    SBDropDown.shared.strTimeFormatter = "HH:mm a" 
    SBDropDown.shared.strDateFormatter = "dd-MM-yyyy"
```
And above format is default 😅.

3) There are 3 optional delegate methods for protocol  called ```SBDateProtocol``` as below,
```
    didSBDateValueChanged(date: Date)
```
this gives when user change date picker value.

```
    btnSBSelectPressed(date: Date)
```
this methods called when user taps on ```Select``` btn.

``` 
    btnSBSelectDateOption(type: SBDateEnum)
```
this methods returns when user taps on data, time ordatetime as well


## Requirements

- iOS 10.0+ 
- Xcode 10.2+
- Swift 5+


## Installation

[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate SBDropDown into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'SBDropDown'
```

## License

SBDropDown is released under the MIT license. [See LICENSE](https://github.com/ShashikantBhadke/SBDropDown/blob/master/LICENSE) for details.


**NOTE:- In demo app pod is removed so please install it before use.. Thanks😀 Again**
### HaPPy😃 to HeAr🤔 fRom yoU...😁....

