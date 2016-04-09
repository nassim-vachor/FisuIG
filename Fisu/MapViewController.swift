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


class MapViewController: UIViewController , MKMapViewDelegate, NSFetchedResultsControllerDelegate  {
    
     var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    @IBAction func home(sender: AnyObject) {
         self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }
   
    @IBOutlet weak var mapView: MKMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        frc = Location.getLocationFetchedResultController("Location", key: "idLoc")
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            
                print("An error occured")
            }
            
        let sections = frc.sections
        let currentSection = sections![0]
      
            // parcours de location
        for var i = 0; i < currentSection.numberOfObjects; i++    {
            let indexPath = NSIndexPath(forItem: i , inSection: 0)
            let loc = frc.objectAtIndexPath(indexPath)  as! Location
            
            let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees(loc.latitude!), longitude: CLLocationDegrees(loc.longitude! ))
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = loc.address
            annotation.subtitle = "Montpellier"
            mapView.addAnnotation(annotation)

        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
  
    
}




