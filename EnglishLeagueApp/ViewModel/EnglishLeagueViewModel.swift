//
//  EnglishLeagueViewModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation


class EnglishLeagueViewModel{
    
    var bindResultsToViewController : (() -> ())?
    
    var apiResult: ApiResultsModel?
    
    var matches : [MatchModel]?{
        didSet{
            bindResultsToViewController?()
        }
    }
    
    var error : Error?{
        didSet{
            bindResultsToViewController?()
        }
    }
    
    func getMatches(){
        
        let url = MainUrls.matchesUrl.stringValue()
        NetworkManager.shared.fetchMatchesData(url: url) { apiResult, error in
            guard error == nil else{
                self.error = error
                return
            }
            guard let apiResult = apiResult else{
                return
            }
            self.matches = apiResult.matches
        }
    }
    
}
