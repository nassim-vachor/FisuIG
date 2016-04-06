//
//  Accomodation.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
import Foundation
import CoreData
import UIKit


class Accomodation: NSManagedObject {
    

    
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
    
    // get datilAcco from DB wich concerne acco "x"
    class func getDetailAccoFetchedResultController(  c : String  , key : String, predicat: String, args: CVarArgType   ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequestWithPredicat(c , key: key, predicat: predicat, args: args), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    // get result from Accomodation table  with NSFetchedResultsController
    class func getAccoFetchedResultController(  c : String  , key : String ) -> NSFetchedResultsController {
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
    
    
    // fonction permmettant d'afficher le jour, date, année
    
    func getDay() -> String
    {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        let timeString = formatter.stringFromDate(self.ouverture!)
        return timeString
        
        
    }
    
    // fonction permettant d'avoir l'heure d'ouverture d'un restau
    func getTimeDeb() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.ouverture!)
        return timeString
    }
    // fonction permettant d'avoir l'heure de fermeture d'un restau
    func getTimeFin() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.fermeture!)
        return timeString
    }
    
    // methode de classe pour l'insertion d'une nouvelle Accomodation
    class func  insertNewAccomodation( context: NSManagedObjectContext ,id: NSNumber, nom: String, desc: String,  dateD: String, dateF: String,adresse: Location?, tel: String, photo: String?) -> Accomodation?{
        let AccomodationDescription = NSEntityDescription.entityForName( "Accomodation", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = AccomodationDescription
        let pred = NSPredicate(format: "(idAcco = %@)", id)
        request.predicate = pred
        var Acco: Accomodation? = nil
        do{
            var result = try context.executeFetchRequest(request)
            // on vérifie que le restau n'existe pas déja dans la base
            
            if result.count == 0 {
                
                
                let newAccomodation = NSEntityDescription.insertNewObjectForEntityForName("Accomodation", inManagedObjectContext:context ) as! Accomodation
                newAccomodation.idAcco = id
                newAccomodation.name = nom
                newAccomodation.descAcco = desc
                newAccomodation.ouverture = convertStringToNSDate(dateD)
                newAccomodation.fermeture = convertStringToNSDate(dateF)
                newAccomodation.phoneAcco = tel
                newAccomodation.setValue(adresse, forKeyPath: "isLocated")
                // Pour rajouter l'image on prends une image et le transforme en NSData
                let newImage = UIImage ( named : photo!)
                newAccomodation.photoA = UIImageJPEGRepresentation(newImage!, 1.0)
                Acco = newAccomodation
                do{
                    try context.save()   //newAccomodation.managedObjectContext?.save()
                    print("data saved")
                } catch{
                  print("there was an error saving data")
                    
                }
                
            }
            else {
                // pour recuperer l activite qui est deja dans la bd
                let Accomo = result[0] as! Accomodation
                return Accomo
            }
            
        }
            
        catch {
            print("insertion not done")
            
        }
        
        return Acco
        
    }

}