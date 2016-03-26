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

// Insert code here to add functionality to your managed object subclass
  /*  @NSManaged var address: String?
    @NSManaged var idLoc: NSNumber?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var correspond: NSSet?
    @NSManaged var correspond2: NSSet?
    @NSManaged var correspond3: NSSet?*/
    
    // methode de classe pour l'insertion d'une nouvelle Location
    class func  insertNewLocation( context: NSManagedObjectContext ,id: NSNumber, address: String, lat: NSNumber, long: NSNumber) -> Location?{
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
