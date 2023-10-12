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
    
    func fetchData(url: String){
        let networkModel = NetworkModel()
        networkModel.fetchData(url: url) { T in
            
        }
    }
}
