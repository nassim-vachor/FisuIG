//
//  Restaurant.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import Foundation
import CoreData
import UIKit



class Restaurant: NSManagedObject {
    
    
    // RequestDB (interaction with DB)
    class  func FetchRequest( c : String  , key : String ) -> NSFetchRequest{
        let FetchRequest = NSFetchRequest ( entityName:c)
        let sortDescriptor = NSSortDescriptor(key: key, ascending: true)
        FetchRequest.sortDescriptors = [ sortDescriptor]
        return FetchRequest
    }
    
    // Request DB with Predicat
    
    class  func FetchRequestWithPredicat( c : String  , key : String, predicat: String, args: CVarArgType ) -> NSFetchRequest{
        let FetchRequest = NSFetchRequest ( entityName:c)
        let predicat = NSPredicate(format: predicat, args)
        FetchRequest.predicate = predicat
        let sortDescriptor = NSSortDescriptor(key: key, ascending: true)
        FetchRequest.sortDescriptors = [ sortDescriptor]
        return FetchRequest
    }
    
    // get detailResto from DB wich concerne resto "x"
    class func getDetailRestoFetchedResultController(  c : String  , key : String, predicat: String, args: CVarArgType   ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequestWithPredicat(c , key: key, predicat: predicat, args: args), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    // get result from Accomodation table  with NSFetchedResultsController
    class func getRestoFetchedResultController(  c : String  , key : String ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequest(c, key: key), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    
    
    
    
    
    class  func convertStringToNSDate(dateString: String) -> NSDate
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm"
        let dates = formatter.dateFromString(dateString)
        
        return dates!
    }
    //
    
    // fonction permmettant d'afficher le jour, date, année
    
    func getDay() -> String
    {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        let timeString = formatter.stringFromDate(self.hourdeb!)
        return timeString
        
        
    }
    
    // fonction permettant d'avoir l'heure d'ouverture d'un restau
    func getTimeDeb() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.hourdeb!)
        return timeString
    }
    // fonction permettant d'avoir l'heure de fermeture d'un restau
    func getTimeFin() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.hourFin!)
        return timeString
    }
    
    
    // methode de classe pour l'insertion d'une nouvelle Restaurant
    class func  insertNewRestaurant( context: NSManagedObjectContext ,id: NSNumber, nom: String, spec: String,  dateD: String, dateF: String,adresse: Location?, tel: String, photo: String?) -> Restaurant?{
        let RestaurantDescription = NSEntityDescription.entityForName( "Restaurant", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = RestaurantDescription
        let pred = NSPredicate(format: "(idRes = %@)", id)
        request.predicate = pred
        var Resto: Restaurant? = nil
        do{
            var result = try context.executeFetchRequest(request)
            // on vérifie que le restau n'existe pas déja dans la base
            
            if result.count == 0 {
                
                
                let newRestaurant = NSEntityDescription.insertNewObjectForEntityForName("Restaurant", inManagedObjectContext:context ) as! Restaurant
                newRestaurant.idRes = id
                newRestaurant.nameRes = nom
                newRestaurant.speciality = spec
                newRestaurant.hourdeb = convertStringToNSDate(dateD)
                newRestaurant.hourFin = convertStringToNSDate(dateF)
                newRestaurant.phoneRes = tel
                newRestaurant.setValue(adresse, forKeyPath: "isLocated2")
                // Pour rajouter l'image on prends une image et le transforme en NSData
                let newImage = UIImage ( named : photo!)
                newRestaurant.photoRes = UIImageJPEGRepresentation(newImage!, 1.0)
                
                Resto = newRestaurant
                do{
                    try context.save()   //newRestaurant.managedObjectContext?.save()
                    print("data saved")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
            else {
                // pour recuperer l activite qui est deja dans la bd
                let Restau = result[0] as! Restaurant
                return Restau
            }
            
        }
            
        catch {
            print("insertion not done")
            
        }
        
        return Resto
        
    }

    
    
    
    
    

}

