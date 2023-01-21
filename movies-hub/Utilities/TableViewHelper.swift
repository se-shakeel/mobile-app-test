//
//  TableViewHelper.swift
//  movies-hub
//
//  Created by Shakeel on 1/21/23.
//

import UIKit

class TableViewHelper {
    static func configureTableView(_ tableView: UITableView, cellIdentifier: String) {
        tableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.separatorInset = .zero
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView()
    }
}
