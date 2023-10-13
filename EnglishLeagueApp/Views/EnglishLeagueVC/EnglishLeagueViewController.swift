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
    
    //MARK: - Properties -
    var matches = [MatchesModel]()
    var englishLeagueVM = EnglishLeagueViewModel()
    
    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        englishLeagueVM.getMatches()
        englishLeagueVM.bindResultsToViewController = {
            guard let matches = self.englishLeagueVM.matches else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Could not fetch data", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
                return
            }
            self.renderResults(matches: matches)
        }
    }

    func renderResults(matches: [MatchesModel]){
        self.matches = matches
        DispatchQueue.main.async {
            self.englishLeagueTableView.reloadData()
        }
    }

}

