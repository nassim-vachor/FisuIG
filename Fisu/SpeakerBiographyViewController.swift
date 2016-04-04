//
//  SpeakerBiographyViewController.swift
//  Fisu
//
//  Created by Djeneba KANE on 03/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class SpeakerBiographyViewController: UIViewController {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var receved2: Speaker? = nil
  //  var spek = [ Speaker]()

    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!

    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var biographyLabel: UILabel!
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
   /*     let fetchRequest = NSFetchRequest ( entityName: "Speaker")
        let predicat = NSPredicate(format: "participate=%@", receved2!)
        fetchRequest.predicate = predicat
        // fetchRequest.returnsDistinctResults = true
        //    fetchRequest.propertiesToFetch = ["dayIs"]
        //fetchRequest.propertiesToGroupBy = ["dayIs"]
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Speaker]
            spek = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")*/
            
        
        
       nomLabel.text = (receved2!.surname)! + "  " + (receved2!.name)!
        phoneLabel.text = "Phone : \(receved2!.phone!)"
        Image.image = UIImage(data: (receved2?.photoSpe)!, scale: 0.1)
        biographyLabel.text = "Biography: \(receved2!.biography!)"
      
    //     "\(activity[0].isPresented!.surname!)"+" \(activity[0].isPresented!.name!)"
      /*  print ( hotel[0].getTimeDeb())
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
        */


        

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
