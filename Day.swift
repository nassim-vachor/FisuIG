//
//  Day.swift
//  Fisu
//
//  Created by nassim on 26/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import Foundation
import CoreData
/*
@NSManaged var keyDay: NSNumber?
@NSManaged var day: String?
@NSManaged var dayActivity: NSSet?
*/

class Day: NSManagedObject {

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
                    try context.save()   //newDay.managedObjectContext?.save()
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
