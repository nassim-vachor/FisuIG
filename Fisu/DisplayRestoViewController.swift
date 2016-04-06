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

class DisplayRestoViewController: UIViewController, NSFetchedResultsControllerDelegate {
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    @IBOutlet weak var nomLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var heurLabel: UILabel!
    @IBOutlet weak var telLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    @IBOutlet weak var imageResto: UIImageView!
    @IBOutlet weak var mapResto: MKMapView!
    
    var receved: Restaurant? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // get detailResto for the resto selected
        frc = Restaurant.getDetailRestoFetchedResultController("Restaurant", key: "idRes", predicat: "idRes=%@", args: (receved?.idRes)!)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let res = frc.objectAtIndexPath(indexPath)  as! Restaurant
        
        nomLabel.text = res.nameRes
        descLabel.text = "About This Restaurant : \(res.speciality!)"

        heurLabel.text = "Openning Hours\n \(res.getTimeDeb())"+" - \(res.getTimeFin())"
        telLabel.text = "Phone : \(res.phoneRes!)"
        adresseLabel?.text = "Location Map : \((res.isLocated2!).address!)"
        imageResto.image = UIImage(data: (res.photoRes)!, scale: 0.1)
        let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (res.isLocated2?.latitude)! ), longitude: CLLocationDegrees((res.isLocated2?.longitude)! ))
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapResto.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = res.nameRes
        annotation.subtitle = "Montpellier"
        mapResto.addAnnotation(annotation)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
}
