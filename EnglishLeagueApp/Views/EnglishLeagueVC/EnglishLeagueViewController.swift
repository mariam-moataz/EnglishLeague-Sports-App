//
//  EnglishLeagueViewController.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 11/10/2023.
//

import UIKit

class EnglishLeagueViewController: BaseVC {

    //MARK: - Outlets -
    @IBOutlet weak var englishLeagueTableView: UITableView!
    @IBOutlet weak var categoryToggle: UISwitch!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    //MARK: - Properties -
    var matches = [MatchModel]()
    var favoriteMatches = [MatchModel]()
    
    let englishLeagueVM = EnglishLeagueViewModel()
    let coreDataVM = CoreDataViewModel()
    var currentRow : Int?
    
    //MARK: - Methods -
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
    }

    override func viewWillAppear(_ animated: Bool) {
        getMatches()
        fetchFavorites()
        categoryToggle.addTarget(self, action: #selector(switchValueChanged), for: .valueChanged)
    }
    
    
    @objc func switchValueChanged(){
        if categoryToggle.isOn{
            titleLabel.text = "English Leauge"
            checkIfFavorite()
            englishLeagueTableView.reloadData()
        }else{
            titleLabel.text = "Favorite Matches"
            coreDataVM.getFavorites(appDelegate: AppDelegate()) { favoriteMatches, error in
                guard let favoriteMatches = favoriteMatches else{return}
                self.favoriteMatches = favoriteMatches
                DispatchQueue.main.async {
                    self.englishLeagueTableView.reloadData()
                }
            }
        }
        
    }
    
    func renderResults(matches: [MatchModel]){
        self.matches = matches
        self.checkIfFavorite()
        DispatchQueue.main.async {
            self.englishLeagueTableView.reloadData()
        }
    }
    
    func getMatches(){
        showIndicator()
        englishLeagueVM.getMatches()
        englishLeagueVM.bindResultsToViewController = {
            DispatchQueue.main.async {
                self.hideIndicator()
            }
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
    
    func fetchFavorites(){
        coreDataVM.getFavorites(appDelegate: AppDelegate()) { favoriteMatches, error in
            guard error == nil else{
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: "Could not fetch favorites", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default))
                    self.present(alert, animated: true)
                }
                return
            }
            if let favoriteMatches = favoriteMatches{
                self.favoriteMatches = favoriteMatches
            }
        }
    }
    
    func checkIfFavorite(){
        if favoriteMatches.count != 0 {
            for i in 0...favoriteMatches.count-1 {
                for j in 0...matches.count-1 {
                    if favoriteMatches[i].id == matches[j].id{
                        matches[j].favoriteState = true
                    }
                }
            }
        }
    }

}

extension EnglishLeagueViewController : AddToFavoriteDelegate{
    func addToFavorite(rowOfIndexPath: Int) {
        coreDataVM.addToFavorites(appDelegate: AppDelegate(), match: matches[rowOfIndexPath])
    }
    
    
}

