//
//  StringExtension.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation


extension String{
    
    func convertUTCStringToString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")

        if let utcDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = "dd:MM:yyyy - HH:mm:ss"
            let formattedString = dateFormatter.string(from: utcDate)
            return formattedString
        } else {
            return nil
        }
    }
}
