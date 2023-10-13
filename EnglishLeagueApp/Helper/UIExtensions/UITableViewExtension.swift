//
//  UITableViewExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import UIKit

extension UITableView{
    //this is the function that I register the cell with
    func registerCell <cell : UITableViewCell> (cellType: cell.Type){
        let cellIdentifier = String(describing: cellType)
        self.register(cell.self, forCellReuseIdentifier: cellIdentifier)
    }
    
    func dequeueReusableCell <Cell : UITableViewCell> (with cellType: Cell.Type, for indexPath: IndexPath) -> Cell{
        let cellIdentifier = String(describing: cellType)
        guard let cell = self.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? Cell else {
            fatalError("Unable to dequeue cell with identifier: \(cellIdentifier)")
        }
        return cell
    }
}
