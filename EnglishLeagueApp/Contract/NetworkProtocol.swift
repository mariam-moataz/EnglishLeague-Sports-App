//
//  NetworkProtocol.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 12/10/2023.
//

import Foundation


protocol NetworkProtocol{
    func fetchData<T>(url: String?, compiletionHandler: @escaping (T?) -> Void) where T : Decodable
}
