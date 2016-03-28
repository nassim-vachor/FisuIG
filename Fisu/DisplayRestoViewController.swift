//
//  DisplayRestoViewController.swift
//  Fisu
//
//  Created by Djeneba KANE on 28/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class DisplayRestoViewController: UIViewController {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var heurLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var imageResto: UIImageView!
    @IBOutlet weak var mapResto: MKMapView!
    
    var receved: Restaurant? = nil
    var rest = [ Restaurant ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest ( entityName: "Restaurant")
        let predicat = NSPredicate(format: "idRes=%@", (receved?.idRes)!)
        fetchRequest.predicate = predicat
      
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Restaurant]
            rest = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        nomLabel.text = rest[0].nameRes
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

       
        
        // Do any additional setup after loading the view.
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
    
    
}
