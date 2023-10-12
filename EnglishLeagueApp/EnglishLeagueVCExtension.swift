//
//  EnglishLeagueVCExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import UIKit


extension EnglishLeagueViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func setUpTableView(){
        englishLeagueTableView.delegate = self
        englishLeagueTableView.dataSource = self
        setUpTableViewCells()
    }
    func setUpTableViewCells(){
        englishLeagueTableView.registerCell(cellType: MatchesTableViewCell.self)
    }
}
