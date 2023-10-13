//
//  NetworkManager.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


class NetworkManager{
    static let shared = NetworkManager()
    private init (){}
    

    func fetchMatchesData(url: String, compilation:@escaping (ApiResultsModel?, Error?) -> Void){

        NetworkModel.shared.fetchData(url: url) { results, error in
            guard error == nil else{
                compilation(nil,error)
                return
            }
            compilation(results,nil)
        }
    }
}
