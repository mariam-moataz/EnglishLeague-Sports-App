//
//  EnglishLeagueViewController.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 11/10/2023.
//

import UIKit

class EnglishLeagueViewController: UIViewController {

    //MARK: - Outlets -
    @IBOutlet weak var englishLeagueTableView: UITableView!
    
    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }


}

