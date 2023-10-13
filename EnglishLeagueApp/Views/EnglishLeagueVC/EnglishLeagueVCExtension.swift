//
//  EnglishLeagueVCExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import UIKit



extension EnglishLeagueViewController{
    func setUpTableView(){
        englishLeagueTableView.delegate = self
        englishLeagueTableView.dataSource = self
        setUpTableViewCells()
    }
    func setUpTableViewCells(){
        //englishLeagueTableView.registerCell(cellType: MatchesTableViewCell.self)
        //ordersTable.register(UINib(nibName: "OrderTableViewCell", bundle: nil), forCellReuseIdentifier: "ordercell")
        englishLeagueTableView.register(UINib(nibName: "MatchesTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchesTableViewCell")
    }
}

extension EnglishLeagueViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if categoryToggle.isOn{
            return matches.count
        }else{
            return favoriteMatches.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(with: MatchesTableViewCell.self, for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTableViewCell") as! MatchesTableViewCell
        if categoryToggle.isOn{
            cell.configureCell(matchData: matches[indexPath.row])
            cell.rowOfIndexPath = indexPath.row
            cell.delegate = self
            if matches[indexPath.row].favoriteState == true{
                cell.favoriteStack.isHidden = true
            }else{
                cell.favoriteStack.isHidden = false
            }
        }else{
            cell.configureCell(matchData: favoriteMatches[indexPath.row])
            cell.favoriteStack.isHidden = true
        }

        cell.noSelectionStyle()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
}
