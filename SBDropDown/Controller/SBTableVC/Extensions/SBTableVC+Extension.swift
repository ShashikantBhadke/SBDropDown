//
//  SBTableVC+Extension.swift
//  SBDropDown
//
//  Created by Shashikant's Mac on 7/29/19.
//  Copyright © 2019 redbytes. All rights reserved.
//

import UIKit

// MARK:- Extension for UITableViewDataSource
extension SBTableVC: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrElement.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: SBTableCell.self)) as? SBTableCell else {
            return UITableViewCell()
        }
        if arrElement.count > indexPath.row {
            delegate?.configCellFor(currentIndex: indexPath.row, arrSelectedIndex: arrSelectedIndex, currentData: arrElement[indexPath.row], cell: cell, key: self.key)
        }
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if isClearOnDoubleTab, arrSelectedIndex.contains(indexPath.row) {
            arrSelectedIndex.removeAll(where: { $0 == indexPath.row })
        } else {
            if !isMultiSelect {
                arrSelectedIndex.removeAll()
            }
            arrSelectedIndex.append(indexPath.row)
        }
        
        if isReloadAfterSelection {
            tableView.reloadData()
        }
        
        if arrElement.count > indexPath.row {
            delegate?.didSelectCell(currentIndex: indexPath.row, arrSelectedIndex: arrSelectedIndex, currentData: arrElement[indexPath.row], key: self.key)
            if isDismissOnSelection {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
} //extension

// MARK:- Extension for UITableViewDelegate
extension SBTableVC: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightForRow
    }
    
} //extension
