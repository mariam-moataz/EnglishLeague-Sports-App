//
//  UITableViewExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import UIKit

extension UITableView{
    func registerCell <cell : UITableViewCell> (cellType: cell.Type){
        let cellIdentifier = String(String(describing: cellType))
        self.register(cell.self, forCellReuseIdentifier: cellIdentifier)
    }
}
