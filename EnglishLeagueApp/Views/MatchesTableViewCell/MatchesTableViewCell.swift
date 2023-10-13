//
//  MatchesTableViewCell.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
    
    //MARK: - Outlets -
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var addToFavoriteBtnOutlet: UIButton!
    @IBOutlet weak var favoriteStack: UIStackView!
    
    //MARK: - Properties -
    var imagePressedColusre: (()->())?
    let coreDataViewModel = CoreDataViewModel()
    var delegate : AddToFavoriteDelegate?
    var rowOfIndexPath : Int?
    var state : Bool?
    
    //MARK: - Methods -
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func configureCell(matchData: MatchModel){
        homeTeamLabel.text = matchData.homeTeam?.name
        awayTeamLabel.text = matchData.awayTeam?.name
        if matchData.status == Status.finished.rawValue{
            resultLabel.text = "\(matchData.score?.fullTime?.homeTeam ?? 0) : \(matchData.score?.fullTime?.awayTeam ?? 0)"
        }
        else{
            if let utcDate = matchData.utcDate{
                let date = utcDate.convertUTCStringToString()
                resultLabel.text = "\(date ?? "")"
            }
        }
    }
    
    
    @IBAction func addToFavoriteBtnPressed(_ sender: UIButton) {
        if addToFavoriteBtnOutlet.imageView?.image == UIImage(systemName: "heart"){
            delegate?.addToFavorite(rowOfIndexPath: rowOfIndexPath ?? 0)
            addToFavoriteBtnOutlet.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}
