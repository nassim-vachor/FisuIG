//
//  Activity.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Activity)
class Activity: NSManagedObject {
    
    //- methode de classe pour convertir un string en Nsdate
    class  func convertStringToNSDate(dateString: String) -> NSDate
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm"
        let dates = formatter.dateFromString(dateString)
        
        return dates!
    }
    

    // fonction permmettant d'afficher le jour, date, année
    
    func getDay() -> String
    {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        let timeString = formatter.stringFromDate(self.dateDeb!)
        return timeString
        
        
    }
    
    // fonction permettant d'avoir l'heure du debut d'une activité
    func getTimeDeb() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.dateDeb!)
        return timeString
    }
    // fonction permettant d'avoir l'heure de fin  d'une activité
    func getTimeFin() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.dateFin!)
        return timeString
    }
    
    
    // methode de classe pour l'insertion d'une nouvelle activity
    class func  insertNewActivity( context: NSManagedObjectContext ,id: NSNumber, nom: String, desc: String, dateD: String, dateF: String, lieu: Location?, speak: Speaker?, photo : String?) -> Activity?{
        let ActivityDescription = NSEntityDescription.entityForName( "Activity", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = ActivityDescription
        let pred = NSPredicate(format: "(idAct = %@)", id)
        request.predicate = pred
        var activity: Activity? = nil
        do{
            var result = try context.executeFetchRequest(request)
            // on vérifie que l'activité n'existe pas déja dans la base
            
            if result.count == 0 {
                
                
                let newActivity = NSEntityDescription.insertNewObjectForEntityForName("Activity", inManagedObjectContext:context ) as! Activity
                newActivity.idAct = id
                newActivity.nomAct = nom
                newActivity.descriptionAct = desc
                newActivity.dateDeb = convertStringToNSDate(dateD)
                newActivity.dateFin = convertStringToNSDate(dateF)
                newActivity.setValue( lieu , forKeyPath: "isLocated3")
                newActivity.setValue(speak, forKeyPath: "isPresented")
                // Pour rajouter l'image on prends une image et le transforme en NSData
                let newImage = UIImage ( named : photo!)
                newActivity.photoActi = UIImageJPEGRepresentation(newImage!, 1.0)
        
                activity = newActivity
                do{
                    try context.save()   //newActivity.managedObjectContext?.save()
                    print("data saved")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
            else {
                // pour recuperer l activite qui est deja dans la bd
                let activ = result[0] as! Activity
                return activ
            }
            
        }
            
        catch {
            print("insertion not done")
            
        }
        
        return activity
        
}


    /*   @NSManaged var dateDeb: NSDate?
    @NSManaged var dateFin: NSDate?
    @NSManaged var descriptionAct: String?
    @NSManaged var idAct: NSNumber?
    @NSManaged var nomAct: String?
    @NSManaged var selected: NSNumber?
    @NSManaged var photoActi: NSData?
    @NSManaged var isLocated3: Location?
    @NSManaged var isPresented: Speaker?
    
    */
}

    