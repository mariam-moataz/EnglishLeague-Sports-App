//
//  BaseVC.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation
import UIKit

class BaseVC : UIViewController{
    
    let indicator = UIActivityIndicatorView(style: .large)

    
    func showIndicator(){
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.startAnimating()
    }
    func hideIndicator(){
        indicator.stopAnimating()
    }
}
