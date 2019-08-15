# SBDropDown
Working on simple dropDown framework.
[Pod Link](https://cocoapods.org/pods/SBDropDown)

     pod 'SBDropDown'

## Usage
![Sample1](https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/1.png)
![Sample2](https://raw.githubusercontent.com/ShashikantBhadke/SBDropDown/master/4.png)
### Custom Text DropDown

1) Initialize dropDown option
 ```
    SBDropDown.setUpDropDown()
``` 

2) To show DropDown with respect with to ``` sourceView ``` and ``` sourceRect ```  *(optional)* 

``` 
    self.showSBDropDown(strTitle: "My Title", arrSelectedIndex: [2], arrElemets: ["Value 1", "Value 2", "Value 3"], sourceView: sender, key: "myKey")
```
where,
- strTitle :- Is the title of dropDown list.
- arrElemets :- Array of you normal or complicated model.
- arrSelectedIndex :- Array of your selected indices if any else set `[]`.
- sourceView :- DropDown arrow is pointing to this view and you haven't provided  `sourceRect` then `sourceView.bounds` is used instead of this
- key :- Extra key if that you may want it for differentiate from others

3) After this you have to define delegate methods for ``` SBProtocol ``` which are already confirmed at start.
```
    configCellFor(currentIndex: Int, arrSelectedIndex: [Int], currentData: Any, cell: SBTableCell, key: Any?)
```

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
            if let str = currentData as? String {
                cell.lblTitle.text = str
                cell.imgvCheckMark.image = arrSelectedIndex.contains(currentIndex) ? #imageLiteral(resourceName: "blueCheck") : nil
                cell.imgvCheckMark.isHidden = cell.imgvCheckMark.image == nil
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

    This methods is called when user tap on any dropDown list this method is triggerd like table view didSelect methods 

And the last dropDown delegate methods is 
```
    btnSelectSBProtocolPressed(arrSelectedIndex: [Int], arrElements: [Any], key: Any?)
```
where,
-  arrSelectedIndex :- As this framework is also support for multi selection. So that it that it has multiple selected indices.
- arrElemets :- Array of you normal or complicated model which you send at start.
- key :- Extra key if that you may want it for differentiate from others

    This methods is called when user tap's on select button.


4) *(Optional)* Drop down Arrow Direction  
    You can change drop down arrow direction as below,
``` 
    SBDropDown.arrowDirection = .down
```
or
       
``` 
    SBDropDown.arrowDirection = [.up, .down]
```

5)  *(Optional)* Drop down Referance  
Working on it to make best use of it. I'm trying to make single referance for this class as like loader but its selected items are not getting clear unless you say so like ` SBDropDown.sbTableVC?.isClearData = true `. 

6) Selecetion type (Default is `Multi Selection`):
To change this you need to set ` SBDropDown.isMultiSelect = true // false `
    

### Date & Time DropDown

1) Initialize dropDown option
```
    SBDropDown.setUpDropDown() 
```
2) And you are ready to use it date and time drop down as below,
```
    self.showDatePicker(sourceView: sender)
```
or
```
    self.showSBDatePicker(strTitle: "Select DOB", currentDate: Date(), minDate: nil, maxDate: nil, sourceView: sender, sourceRect: sender.bounds)
```
3) You can also modify time and date format that show on dropDown segment... like
```
    SBDropDown.strTimeFormatter = "HH:mm a" 
    SBDropDown.strDateFormatter = "dd-MM-yyyy"
```
And above format is default 😅.

4) There are 3 delegate methods for protocol ```SBDateProtocol``` as below,
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
