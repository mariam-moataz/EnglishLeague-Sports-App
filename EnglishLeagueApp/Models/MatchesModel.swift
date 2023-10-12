//
//  MatchesModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


struct MatchesModel : Decodable{
    var id              :Int?
    var season          :Season?
    var utcDate         :String?
    var status          :String?
    var matchday        :Int?
    var score           :Score?
    var homeTeam        :HomeTeam?
    var awayTeam        :AwayTeam?
}
