//
//  UITableView.swift
//  HowIsWeather
//
//  Created by Erhan Toktamış on 6.06.2023.
//

import UIKit

extension UITableViewController {
    func setBackgroundImage(name: String) {
        self.tableView.backgroundView = UIImageView(image: UIImage(named: "fullhd"))
    }
    
    func setNavigationControllerHidden() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
          
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}
