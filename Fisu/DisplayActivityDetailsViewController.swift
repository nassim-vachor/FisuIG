//
//  DisplayActivityDetailsViewController.swift
//  Fisu
//
//  Created by Djeneba KANE on 29/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation
/*
class DisplayActivityDetailsViewController: UIViewController {

      let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    
    var receved2: Activity? = nil
    var rest = [ Activity]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest ( entityName: "Activity")
        let predicat = NSPredicate(format: "idAct=%@", (receved2?.idAct)!)
        fetchRequest.predicate = predicat
        
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Activity]
            rest = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
     /*   nomLabel.text = rest[0].nameRes
        descLabel.text = "About This Restaurant : \(rest[0].speciality!)"
        //[descLabel.text.: "About This Restaurant" ]
        heurLabel.text = "Openning Hours\n \(rest[0].getTimeDeb())"+" - \(rest[0].getTimeFin())"
        telLabel.text = "Phone : \(rest[0].phoneRes!)"
        adresseLabel?.text = "Location Map : \((rest[0].isLocated2!).address!)"
        imageResto.image = UIImage(data: (rest[0].photoRes)!, scale: 0.1)
        let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (rest[0].isLocated2?.latitude)! ), longitude: CLLocationDegrees((rest[0].isLocated2?.longitude)! ))
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapResto.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = rest[0].nameRes
        annotation.subtitle = "Montpellier"
        mapResto.addAnnotation(annotation)
        
        */
        
    }
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}*/
