//
//  ApiResultsModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


struct ApiResultsModel{
    var count: Int?
    var filters : [String:String]?
    var competition : CompetitionData?
}
