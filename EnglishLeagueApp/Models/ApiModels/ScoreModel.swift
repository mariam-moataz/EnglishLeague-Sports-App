//
//  ScoreModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation

struct Score : Decodable{
    var winner :String?
    var duration :String
    var fullTime: Result?
}
