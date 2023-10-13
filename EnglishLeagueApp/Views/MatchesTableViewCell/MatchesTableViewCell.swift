//
//  MatchesTableViewCell.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    func configureCell(matchData: MatchesModel){
        homeTeamLabel.text = matchData.homeTeam?.name
        awayTeamLabel.text = matchData.awayTeam?.name
        resultLabel.text = "\(matchData.score?.fullTime?.homeTeam ?? 0) : \(matchData.score?.fullTime?.awayTeam ?? 0)"
    }

//    func configure(){
//        homeTeamLabel.text = "sada"
//        awayTeamLabel.text = "asddasd"
//        resultLabel.text = "sadas"
//    }
}
