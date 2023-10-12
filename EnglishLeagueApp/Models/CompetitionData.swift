//
//  CompetitionData.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


struct CompetitionData : Decodable{
    var id              : Int?
    var name            : String?
    var area            : Area?
    var code            : String?
    var plan            : String?
    var lastUpdated     : String?
}


struct Area : Decodable{
    var id              : Int?
    var name            : String?
}
