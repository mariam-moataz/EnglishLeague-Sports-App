//
//  MatchModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


struct MatchModel : Decodable{
    var id              :Int?
    var utcDate         :String?
    var status          :String?
    var score           :Score?
    var homeTeam        :HomeTeam?
    var awayTeam        :AwayTeam?
    
    var favoriteState   :Bool?
}
