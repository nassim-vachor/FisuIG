//
//  Day.swift
//  Fisu
//
//  Created by nassim on 26/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
import UIKit

import Foundation
import CoreData


class Day: NSManagedObject{
    
    /// methode de classe--
    /// Request DB
    /// - parameter c:le nom de la classe, key: la clé du tri
    /// - returns: la requete
   
    class  func FetchRequest( c : String  , key : String ) -> NSFetchRequest{
        let FetchRequest = NSFetchRequest ( entityName:c)
        let sortDescriptor = NSSortDescriptor(key: key, ascending: true)
       FetchRequest.sortDescriptors = [ sortDescriptor]
        return FetchRequest
    }
    
    /// methode de classe--
    /// Request DB with Predicat
    /// - parameter c:le nom de la classe, key: la clé du tri, (predicat, args): la clause where de la requete
    /// - returns: la requete
    
    class  func FetchRequestWithPredicat( c : String  , key : String, predicat: String, args: CVarArgType ) -> NSFetchRequest{
        let FetchRequest = NSFetchRequest ( entityName:c)
        let predicat = NSPredicate(format: predicat, args)
        FetchRequest.predicate = predicat
        let sortDescriptor = NSSortDescriptor(key: key, ascending: true)
        FetchRequest.sortDescriptors = [ sortDescriptor]
        return FetchRequest
    }
    
    /// get activities from DB wich concerne Day "x"
    /// - parameter c:le nom de la classe, key: la clé du tri, (predicat, args): la clause where de la requete*
    /// - returns: les activités correspondantes au jour selectionnées
    
    class func getActivityFetchedResultController(  c : String  , key : String, predicat: String, args: CVarArgType   ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequestWithPredicat(c , key: key, predicat: predicat, args: args), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
   // get result from Day table  with NSFetchedResultsController
    /// - parameter c:le nom de la classe, key: la clé du tri
    /// - returns: les jours existants dans la base ( day1, day2...........day6)
    
    class func getDayFetchedResultController(  c : String  , key : String ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
         let frc = NSFetchedResultsController(fetchRequest: FetchRequest(c, key: key), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    class  func deleteData (id: NSNumber) {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let ActivityDescription = NSEntityDescription.entityForName( "Day", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = ActivityDescription
        let pred = NSPredicate(format: "(keyDay = %@)", id)
        request.predicate = pred
        do{
            let result = try context.executeFetchRequest(request)
            // on vérifie que l'activité n'existe pas déja dans la base
            
            if let entityToDelete = result.first{
                context.deleteObject(entityToDelete as! NSManagedObject)
                do{
                    try context.save()   //newActivity.managedObjectContext?.save()
                    print("data updated")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
        }
        catch {
            let deleteError = error as NSError
            print("\(deleteError), \(deleteError.userInfo)")
            
        }
    }
    
    /// methode de classe pour l'insertion d'une nouveau jour
    /// elle prend en parametre tous les champs de la classe activité
    /// - returns: le jour inserée si elle existe pas, sinon le jour emême si il existe déja
    
    class func  insertNewDay( context: NSManagedObjectContext ,id: NSNumber, day: String) -> Day?{
        let DayDescription = NSEntityDescription.entityForName( "Day", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = DayDescription
        let pred = NSPredicate(format: "(keyDay = %@)", id)
        request.predicate = pred
        var jour: Day? = nil
        do{
            var result = try context.executeFetchRequest(request)
            // on vérifie que le restau n'existe pas déja dans la base
            
            if result.count == 0 {
                
                
                let newDay = NSEntityDescription.insertNewObjectForEntityForName("Day", inManagedObjectContext:context ) as! Day
                newDay.keyDay = id
                newDay.day = day
                
                //m
                jour = newDay
                do{
                    try context.save()   
                    print("data saved")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
            else {
                // pour recuperer l activite qui est deja dans la bd
                let journee = result[0] as! Day
                return journee
            }
            
        }
            
        catch {
            print("insertion not done")
            
        }
        
        return jour
        
    }

}
