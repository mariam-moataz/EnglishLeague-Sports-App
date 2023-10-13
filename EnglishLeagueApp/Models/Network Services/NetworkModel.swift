//
//  NetworkModel.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation
import Alamofire

class NetworkModel{
    
    static let shared = NetworkModel()
    private init(){}
    
    func fetchData<T>(url: String?, compiletionHandler: @escaping (T?, Error?) -> Void) where T : Decodable {
        
        let httpHeader : HTTPHeader = HTTPHeader(name: UserKeys.authKey.rawValue, value: UserKeys.accessToken.rawValue)
        
        let request = AF.request(url ?? "",headers: [httpHeader])
        
        request.responseDecodable(of:T.self) { (response) in
            guard response.error == nil else{
                compiletionHandler(nil,response.error!)
                return
            }
            guard let APIResult = response.value else {
                compiletionHandler(nil,nil)
                return }
            
            compiletionHandler(APIResult,nil)
        }
    }
}
