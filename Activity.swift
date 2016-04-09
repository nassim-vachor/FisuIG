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
    /// get detil activity for activity selected in the view
    /// fonction qui sera appeler par le viewController
    /// - parameter c:le nom de la classe, key: la clé du tri, (predicat, args): la clause where de la requete
    /// - precondition: elle fait appel à la fonction FetchRequestWithPredicat
    /// - returns: le résultat de la requete
    class func getDetailActivityFetchedResultController(  c : String  , key : String, predicat: String, args: CVarArgType   ) -> NSFetchedResultsController {
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        // recuperation du résultat de la requete FetchRequestWithPredicat
        let frc = NSFetchedResultsController(fetchRequest: FetchRequestWithPredicat(c , key: key, predicat: predicat, args: args), managedObjectContext: context, sectionNameKeyPath: nil , cacheName: nil )
        return frc
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
    
    
    /// fonction permmettant d'afficher le jour, mois, année ( Monday, July 4, 2016)
    /// - rerurns: la date correspondante
    func getDay() -> String
    {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = .FullStyle
        let timeString = formatter.stringFromDate(self.dateDeb!)
        return timeString
        
        
    }
    
    ///fonction permettant d'avoir l'heure du debut d'une activité
    /// - rerurns: l'heure correspondante
    func getTimeDeb() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.dateDeb!)
        return timeString
    }
    // fonction permettant d'avoir l'heure de fin  d'une activité
    /// - rerurns: l'heure correspondante
    func getTimeFin() -> String
    {
        let formatter = NSDateFormatter()
        formatter.timeStyle = .ShortStyle
        let timeString = formatter.stringFromDate(self.dateFin!)
        return timeString
    }

    
    
    
    /// fonction permettant de mettre à jour la BD--
    /// utiliser notamment quand l'utilisateur s'incrit à une activité
    /// - parameter select:la colonne à modifier, id: utiliser dans la clause where afin de selectionner la bonne activité
        func updateData ( select: NSNumber , id: NSNumber){
        let context = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        let ActivityDescription = NSEntityDescription.entityForName( "Activity", inManagedObjectContext : context)
        let request = NSFetchRequest()
        request.entity = ActivityDescription
        let pred = NSPredicate(format: "(idAct = %@)", id)
        request.predicate = pred
        do{
            let result = try context.executeFetchRequest(request)
            // on vérifie que l'activité n'existe pas déja dans la base
            
            if result.count != 0 {
                let manage = result[0]
                manage.setValue( select , forKeyPath: "selected")
                do{
                    try context.save()   //newActivity.managedObjectContext?.save()
                    print("data updated")
                } catch{
                    print("there was an error saving data")
                    
                }
                
            }
        }
        catch {
            let updateError = error as NSError
            print("\(updateError), \(updateError.userInfo)")
            
        }
    }
    
    /// methode de classe pour l'insertion d'une nouvelle activity
    /// elle prend en parametre tous les champs de la classe activité
    /// - returns: l'activité inserée si elle existe pas, sinon l'activité elle même si elle existe déja
    
    class func  insertNewActivity( context: NSManagedObjectContext ,id: NSNumber, nom: String, desc: String, dateD: String, dateF: String, lieu: Location?, speak: Speaker?, photo : String?, day: Day?, selected:Bool) -> Activity?{
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
                newActivity.selected = selected
                newActivity.setValue( lieu , forKeyPath: "isLocated3")
                newActivity.setValue(speak, forKeyPath: "isPresented")
                newActivity.setValue(day, forKeyPath: "dayIs")
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
                
         } else {
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
    
    
}

    