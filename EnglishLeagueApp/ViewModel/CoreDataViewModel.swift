//
//  CoreDataViewModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation


class CoreDataViewModel{
    var bindResultsToViewController : (() -> ())?

    var matches : [MatchModel]?{
        didSet{
            bindResultsToViewController?()
        }
    }
    
    func getFavorites(appDelegate: AppDelegate, compilation: @escaping ([MatchModel]?, Error?) -> Void){
        DatabaseManager.shared.getFavourites(appDelegate: appDelegate) { matches, error in
            guard error == nil else{
                compilation(nil,error)
                return
            }
            if matches != nil{
                compilation(matches,nil)
            }
            else{
                print("No data to be fetched")
            }
        }
    }
    
    func addToFavorites(appDelegate: AppDelegate, match: MatchModel){
        DatabaseManager.shared.addToFavourite(appDelegate: appDelegate, match: match)
    }
}
