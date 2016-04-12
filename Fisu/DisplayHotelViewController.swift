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
        

        
        let myString:NSString = "About This Hotel : \(acco.descAcco!)"
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 15.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 18))
        myMutableString.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 18))
        descLabel.attributedText = myMutableString
        
      //  heurLabel.text = "Openning Hours\n\(acco.getTimeDeb())"+" - \(acco.getTimeFin())"
        
        
        // Modification de la couleur de heurLabel
        let myString2:NSString = "Openning Hours\n\(acco.getTimeDeb())"+" - \(acco.getTimeFin())"
        var myMutableString2 = NSMutableAttributedString()
        
        myMutableString2 = NSMutableAttributedString(string: myString2 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 14.0)!])
        myMutableString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 14))
        myMutableString2.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 14.0)!, range: NSRange(location: 0, length: 14))
          heurLabel.attributedText = myMutableString2
        
       //
        let myString3:NSString = "Phone : \(acco.phoneAcco!)"
        var myMutableString3 = NSMutableAttributedString()
        myMutableString3 = NSMutableAttributedString(string: myString3 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 14.0)!])
        myMutableString3.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 7))
        myMutableString3.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 14.0)!, range: NSRange(location: 0, length: 7))
        telLabel.attributedText = myMutableString3
        
        
      //  adresseLabel?.text = "Location Map : \((acco.isLocated!).address!)"
        
        let myString4:NSString = "Location Map : \((acco.isLocated!).address!)"
        var myMutableString4 = NSMutableAttributedString()
        myMutableString4 = NSMutableAttributedString(string: myString4 as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 15.0)!])
        myMutableString4.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 15))
        myMutableString4.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 15))
       adresseLabel?.attributedText = myMutableString4

        
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
