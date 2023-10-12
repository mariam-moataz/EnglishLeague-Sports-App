//
//  NetworkModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import Alamofire

class NetworkModel{
    func fetchData<T>(url: String?, compiletionHandler: @escaping (T?) -> Void) where T : Decodable {
        
        let request = AF.request(url ?? "")
        
        request.responseDecodable(of:T.self) { (response) in
            guard let APIResult = response.value else {
                
                compiletionHandler(nil)
                return }
            
            compiletionHandler(APIResult)
        }
    }
}
