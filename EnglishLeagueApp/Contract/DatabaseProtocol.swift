//
//  DatabaseProtocol.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation

protocol DatabaseProtocol{
    func addToFavourite(appDelegate: AppDelegate, match: MatchModel)
}
