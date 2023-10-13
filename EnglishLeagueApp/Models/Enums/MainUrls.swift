//
//  MainUrls.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation


enum MainUrls : String{
    
    private var baseURL : String { return "https://api.football-data.org"}
    
    case mainUrl
    case matchesUrl
    
    func stringValue() -> String{
        switch self{
        case .mainUrl:
            return baseURL
        case .matchesUrl:
            return baseURL + "/v2/competitions/2021/matches"
        }
    }
}
