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

class DisplayHotelViewController: UIViewController, NSFetchedResultsControllerDelegate {
    var receved: Accomodation? = nil
    
    
    @IBOutlet weak var nomLabel: UILabel!
    
    @IBOutlet weak var heurLabel: UILabel!
    
    @IBOutlet weak var telLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var imageHotel: UIImageView!
    @IBOutlet weak var adresseLabel: UILabel!
    
    @IBOutlet weak var mapHotel: MKMapView!
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    override func viewDidLoad() {
        super.viewDidLoad()
        // get detailAcco for the acco selected
        frc = Activity.getDetailActivityFetchedResultController("Accomodation", key: "idAcco", predicat: "idAcco=%@", args: (receved?.idAcco)!)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let acco = frc.objectAtIndexPath(indexPath)  as! Accomodation
    
        nomLabel.text = acco.name
        descLabel.text = "About This Restaurant : \(acco.descAcco!)"
        
        heurLabel.text = "Openning Hours\n\(acco.getTimeDeb())"+" - \(acco.getTimeFin())"
        telLabel.text = "Phone : \(acco.phoneAcco!)"
        adresseLabel?.text = "Location Map : \((acco.isLocated!).address!)"
        imageHotel.image = UIImage(data: (acco.photoA)!, scale: 0.1)
        let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (acco.isLocated?.latitude)! ), longitude: CLLocationDegrees((acco.isLocated?.longitude)! ))
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapHotel.setRegion(region, animated: true)
       
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = acco.name
        annotation.subtitle = "Montpellier"
        mapHotel.addAnnotation(annotation)
        
        
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



}
