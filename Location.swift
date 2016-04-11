//
//  Location.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import Foundation
import CoreData
import UIKit


class Location: NSManagedObject {

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
    
    // get result from location table  with NSFetchedResultsController
    class func getLocationFetchedResultController(  c : String  , key : String ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequest(c, key: key), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    class  func deleteData (id: NSNumber) {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let ActivityDescription = NSEntityDescription.entityForName( "Location", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = ActivityDescription
        let pred = NSPredicate(format: "(idLoc = %@)", id)
        request.predicate = pred
        do{
            let result = try context.executeFetchRequest(request)
            // on vérifie que l'activité n'existe pas déja dans la base
            
            if let entityToDelete = result.first{
                context.deleteObject(entityToDelete as! NSManagedObject)
                do{
                    try context.save()   //newActivity.managedObjectContext?.save()
                    print("data deleted")
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
    
    
    /// methode de classe pour l'insertion d'une nouvelle location
    /// elle prend en parametre tous les champs de la classe location
    /// - returns: location inseré si elle existe pas, sinon la location même si elle existe déja
    class func  insertNewLocation( context: NSManagedObjectContext ,id: NSNumber, name : String?, address: String, lat: NSNumber, long: NSNumber) -> Location?{
        let LocationDescription = NSEntityDescription.entityForName( "Location", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = LocationDescription
        let pred = NSPredicate(format: "(idLoc = %@)", id)
        request.predicate = pred
        var Loc: Location? = nil
        do{
            var result = try context.executeFetchRequest(request)
            // on vérifie que le restau n'existe pas déja dans la base
            
            if result.count == 0 {
                
                
                let newLocation = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext:context ) as! Location
                newLocation.idLoc = id
                newLocation.nomLoc = name
                newLocation.address = address
                newLocation.latitude = lat
                newLocation.longitude = long
               
                //m
                Loc = newLocation
                do{
                    try context.save()   //newLocation.managedObjectContext?.save()
                    print("data saved")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
            else {
                // pour recuperer l activite qui est deja dans la bd
                let Locat = result[0] as! Location
                return Locat
            }
            
        }
            
        catch {
            print("insertion not done")
            
        }
        
        return Loc
        
    }
    
    
}
