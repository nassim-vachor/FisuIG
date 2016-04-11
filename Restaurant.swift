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
    
    /// methode de classe--
    /// get detail resto for resto selected in the view
    /// fonction qui sera appeler par le viewController
    /// - parameter c:le nom de la classe, key: la clé du tri, (predicat, args): la clause where de la requete
    /// - precondition: elle fait appel à la fonction FetchRequestWithPredicat
    /// - returns: le résultat de la requete
    class func getDetailRestoFetchedResultController(  c : String  , key : String, predicat: String, args: CVarArgType   ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequestWithPredicat(c , key: key, predicat: predicat, args: args), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    /// get all resto from DB 
    /// - parameter c:le nom de la classe, key: la clé du tri
    /// - returns: tous les restaurant existant dans la BD
    class func getRestoFetchedResultController(  c : String  , key : String ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let frc = NSFetchedResultsController(fetchRequest: FetchRequest(c, key: key), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
    }
    
    
    /// fonction permettant supprimer une ligne de la table Restau
    /// - parameter id : id de la colonne à supprimer
    class  func deleteData (id: NSNumber) {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let ActivityDescription = NSEntityDescription.entityForName( "Restaurant", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = ActivityDescription
        let pred = NSPredicate(format: "(idRes = %@)", id)
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

    
    
    
    /// methode de classe pour convertir un string en Nsdate
    /// - parameter dateString: string de la forme "dd/MM/yyyy, HH:mm"
    /// - rerurns: le  NSDate correspondant au string saisi
    class  func convertStringToNSDate(dateString: String) -> NSDate
    {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd/MM/yyyy, HH:mm"
        let dates = formatter.dateFromString(dateString)
        
        return dates!
    }
    //
    
    /// fonction permmettant d'afficher le jour, mois, année ( Monday, July 4, 2016)
    /// - rerurns: la date correspondante
    func getDay() -> String
    {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        let timeString = formatter.stringFromDate(self.hourdeb!)
        return timeString
        
        
    }
    
    ///fonction permettant d'avoir l'heure d'ouverture d'un resto
    /// - rerurns: l'heure correspondante
    func getTimeDeb() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.hourdeb!)
        return timeString
    }
    ///fonction permettant d'avoir l'heure de fermeture d'un resto
    /// - rerurns: l'heure correspondante
    func getTimeFin() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.hourFin!)
        return timeString
    }
    
    
    /// methode de classe pour l'insertion d'un nouveau Resto
    /// elle prend en parametre tous les champs de la classe Resto
    /// - returns: le resto inseré si elle existe pas, sinon le resto  même si il existe déja
    class func  insertNewRestaurant( context: NSManagedObjectContext ,id: NSNumber, nom: String, spec: String,  dateD: String, dateF: String,adresse: Location?, tel: String, photo: String?, rating: String?) -> Restaurant?{
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
                let newImage1 = UIImage ( named : rating!)
                newRestaurant.rating = UIImageJPEGRepresentation(newImage1!, 1.0)
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

