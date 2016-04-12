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
       
        // Modification de la couleur du label descLabel
        
        let myString:NSString = "About This Restaurant : \(res.speciality!)"
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName : UIFont( name: "Georgia" , size: 15.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 24))
        myMutableString.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 24))
        descLabel.attributedText = myMutableString
        

        
        
        
        // Modification de la couleur de heurLabel
        let myString2:NSString = "Openning Hours\n\(res.getTimeDeb())"+" - \(res.getTimeFin())"
        var myMutableString2 = NSMutableAttributedString()
        
        myMutableString2 = NSMutableAttributedString(string: myString2 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 14.0)!])
        myMutableString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 14))
        myMutableString2.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 14.0)!, range: NSRange(location: 0, length: 14))
        heurLabel.attributedText = myMutableString2
        
        // Modification de la couleur du label telLabel
        let myString3:NSString = "Phone : \(res.phoneRes!)"
        var myMutableString3 = NSMutableAttributedString()
        myMutableString3 = NSMutableAttributedString(string: myString3 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 13.5)!])
        myMutableString3.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 7))
        myMutableString3.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 13.5)!, range: NSRange(location: 0, length: 7))
        telLabel.attributedText = myMutableString3


     
        //  Modification de la couleur du label adresseLabel
        
        let myString4:NSString =  "Location Map : \((res.isLocated2!).address!)"
        var myMutableString4 = NSMutableAttributedString()
        myMutableString4 = NSMutableAttributedString(string: myString4 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 15.0)!])
        myMutableString4.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 15))
        myMutableString4.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 15))
        adresseLabel?.attributedText = myMutableString4

      
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
