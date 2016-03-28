//
//  DisplayHotelViewController.swift
//  Fisu
//
//  Created by Djeneba KANE on 28/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
import UIKit
import CoreData
import MapKit
import CoreLocation

class DisplayHotelViewController: UIViewController {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var receved: Accomodation? = nil
    var hotel = [ Accomodation ]()
    
    @IBOutlet weak var nomLabel: UILabel!
    
    @IBOutlet weak var heurLabel: UILabel!
    
    @IBOutlet weak var telLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var imageHotel: UIImageView!
    @IBOutlet weak var adresseLabel: UILabel!
    
    @IBOutlet weak var mapHotel: MKMapView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest( entityName: "Accomodation")
        let predicat = NSPredicate(format: "idAcco=%@", (receved?.idAcco)!)
        fetchRequest.predicate = predicat
        
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Accomodation]
            hotel = fetchResult
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        nomLabel.text = hotel[0].name
        descLabel.text = "About This Restaurant : \(hotel[0].descAcco!)"
        print ( hotel[0].getTimeDeb())
        //[descLabel.text.: "About This Restaurant" ]
        heurLabel.text = "Openning Hours\n\(hotel[0].getTimeDeb())"+" - \(hotel[0].getTimeFin())"
        telLabel.text = "Phone : \(hotel[0].phoneAcco!)"
        adresseLabel?.text = "Location Map : \((hotel[0].isLocated!).address!)"
        imageHotel.image = UIImage(data: (hotel[0].photoA)!, scale: 0.1)
        let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (hotel[0].isLocated?.latitude)! ), longitude: CLLocationDegrees((hotel[0].isLocated?.longitude)! ))
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapHotel.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = hotel[0].name
        annotation.subtitle = "Montpellier"
        mapHotel.addAnnotation(annotation)
        
        
        
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
