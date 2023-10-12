//
//  EnglishLeagueVCExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import UIKit


extension EnglishLeagueViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
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

extension EnglishLeagueViewController: UITableViewDelegate{

}
