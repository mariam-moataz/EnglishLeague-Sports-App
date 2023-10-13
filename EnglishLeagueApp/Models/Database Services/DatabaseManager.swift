//
//  DatabaseManager.swift
//  EnglishLeagueApp
//
//  Created by Mariam Moataz on 13/10/2023.
//

import Foundation
import CoreData

class DatabaseManager : DatabaseProtocol
{
    static let shared = DatabaseManager()
    private init (){}
    
    func addToFavourite(appDelegate: AppDelegate, match: MatchModel) {
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Matches", in: managedContext)
            
        let coreDataProduct = NSManagedObject(entity: entity!, insertInto: managedContext)
        coreDataProduct.setValue(true               , forKey: "favoriteState")
        coreDataProduct.setValue(match.id           , forKey: "id")
        coreDataProduct.setValue(match.status       , forKey: "status")
        coreDataProduct.setValue(match.score?.fullTime?.homeTeam      , forKey: "homeTeamScore")
        coreDataProduct.setValue(match.score?.fullTime?.awayTeam      , forKey: "awayTeamScore")
        coreDataProduct.setValue(match.utcDate      , forKey: "date")
        coreDataProduct.setValue(match.homeTeam?.name     , forKey: "homeTeam")
        coreDataProduct.setValue(match.awayTeam?.name     , forKey: "awayTeam")
        do{
            try managedContext.save()
            print(" saved ")
        }catch let error as NSError{
            print("failed to save  \(error.localizedDescription)")
        }
    }
    
    func getFavourites(appDelegate: AppDelegate, complition: @escaping ([MatchModel]?, Error?) -> Void) {
        var favouriteList = [MatchModel]()
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Matches")
        //fetchRequest.predicate = NSPredicate(format: "userID = \(userId)")
        do{
            let matches = try managedContext.fetch(fetchRequest)
            print("fetching done")
            for match in matches{
                let id                      = match.value(forKey: "id")                 as! Int
                let status                  = match.value(forKey: "status")             as! String
                let date                    = match.value(forKey: "date")               as! String
                let homeTeam                = match.value(forKey: "homeTeam")           as! String
                let awayTeam                = match.value(forKey: "awayTeam")           as! String
                let homeTeamScore           = match.value(forKey: "homeTeamScore")      as! Int
                let awayTeamScore           = match.value(forKey: "awayTeamScore")      as! Int
                
                let favoriteState = match.value(forKey: "favoriteState")                as! Bool

                let homeTeamObj = HomeTeam(id: nil, name: homeTeam)
                let awayTeamObj = AwayTeam(id: nil, name: awayTeam)
                let scoreObj = Score(duration: "", fullTime: Result(homeTeam: homeTeamScore, awayTeam: awayTeamScore))
                
                let match = MatchModel(id: id, utcDate: date, status: status, score: scoreObj, homeTeam: homeTeamObj, awayTeam: awayTeamObj,favoriteState: favoriteState)
      
                favouriteList.append(match)
            }
            complition(favouriteList, nil)
        }catch{
            print("failed to fetch  \(error.localizedDescription)")
            complition(nil, error)
        }
    }

    func deleteFavourite(appDelegate: AppDelegate, matchId: String) {
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Matches")
       fetchRequest.predicate = NSPredicate(format: "id = \(matchId)")
      do{
           let matches = try managedContext.fetch(fetchRequest)
           for match in matches {
             managedContext.delete(match)
          }
            try managedContext.save()
            print("deleted ")
        }catch{
            print("failed delete  \(error)")
        }
    }
    
    
}
