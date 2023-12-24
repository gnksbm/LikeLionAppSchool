//
//  UITableView+.swift
//  
//
//  Created by gnksbm on 2023/12/24.
//

import UIKit

public extension UITableView {
    func register(_ cellType: UITableViewCell.Type) {
        register(cellType, forCellReuseIdentifier: cellType.identifier)
    }
}
