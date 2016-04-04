//
//  MapViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation


class MapViewController: UIViewController , MKMapViewDelegate {
    
     let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBAction func home(sender: AnyObject) {
         self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }
   
    @IBOutlet weak var mapView: MKMapView!
    var lieu = [ Location ]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest ( entityName: "Location")
       
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Location]
            lieu = fetchResult
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        self.mapView.delegate = self
      //  self.mapView.dataSource = self
        
        // Do any additional setup after loading the view.
        for var i = 0; i < lieu.count; i++    {
            
 let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( lieu[i].latitude!), longitude: CLLocationDegrees(lieu[i].longitude! ))
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = lieu[i].address
            annotation.subtitle = "Montpellier"
            mapView.addAnnotation(annotation)

            
            
        }
        
    }
    
    
    // parcours de location

  
    

    
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



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


