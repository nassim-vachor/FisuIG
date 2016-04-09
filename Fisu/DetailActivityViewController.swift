//
//  DetailActivityViewController.swift
//  Fisu
//
//  Created by nassim on 03/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class DetailActivityViewController: UIViewController, NSFetchedResultsControllerDelegate {
  
    var receved: Activity? = nil

    

   
    @IBOutlet weak var theSwitch: UISwitch!
 
    @IBAction func switchOnOff(sender: AnyObject) {
    
        if theSwitch.on {
            receved?.updateData(1, id: (receved?.idAct)!)
            
        }
        else {
            receved?.updateData(0, id: (receved?.idAct)!)
        }
        
        self.reloadInputViews()
        NSNotificationCenter.defaultCenter().postNotificationName("load", object: nil )
    }

    
    
    
    
    
    
    @IBOutlet weak var horaireLabel: UILabel!

    @IBAction func biography(sender: AnyObject) {
    }
    
    @IBOutlet weak var actiMap: MKMapView!
    @IBOutlet weak var NomActLabel: UILabel!
    
    @IBOutlet weak var HeureActLabel: UILabel!
    @IBOutlet weak var speakLabel: UILabel!
    
    @IBOutlet weak var imageAct: UIImageView!
    @IBOutlet weak var DescLabel: UILabel!
    @IBOutlet weak var adresseLabel: UILabel!
    
    @IBOutlet weak var speakButton: UIButton!
    
     var frc : NSFetchedResultsController = NSFetchedResultsController()
     
        
      override func viewDidLoad() {
            super.viewDidLoad()
      
        // get detailActivity for the activity selected
        frc = Activity.getDetailActivityFetchedResultController("Activity", key: "idAct", predicat: "idAct=%@", args: (receved?.idAct)!)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        let indexPath = NSIndexPath(forItem: 0, inSection: 0)
        let act = frc.objectAtIndexPath(indexPath)  as! Activity
       
            NomActLabel.text =  act.nomAct  
            DescLabel.text = "About This Event : \(act.descriptionAct!)"
            //[descLabel.text.: "About This Restaurant" ]
            HeureActLabel.text = "\(act.getDay())"
            horaireLabel.text = "\(act.getTimeDeb())"+" - \(act.getTimeFin())"
        
        
        if ( act.isPresented == nil){
            speakLabel.hidden = true
            speakButton.hidden = true
            
            
        } else {
            speakLabel.text = "Speaker :  "
            let surname = act.isPresented!.surname!
            let buttonTitle = String(surname[surname.startIndex]) + ". " + act.isPresented!.name! + ""
            speakButton.setTitle(buttonTitle, forState: UIControlState.Normal)
        }
        
            adresseLabel?.text = "Location Map : \((act.isLocated3!).nomLoc!)"
            imageAct.image = UIImage(data: (act.photoActi)!, scale: 0.1)
            let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (act.isLocated3?.latitude)! ), longitude: CLLocationDegrees((act.isLocated3?.longitude)! ))
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            actiMap.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = act.isLocated3?.address!
            annotation.subtitle = "Montpellier"
            actiMap.addAnnotation(annotation)
        
    }
    

        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if self.receved?.selected == true {
            theSwitch.setOn(true, animated: true)
        }
        else{
            theSwitch.setOn(false, animated: true)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
            
            if  segue.identifier == "speakSegue"{
            
                    let SecondVC = segue.destinationViewController as! SpeakerBiographyViewController
                    
                    SecondVC.receved2 = receved!.isPresented
                

                }
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
