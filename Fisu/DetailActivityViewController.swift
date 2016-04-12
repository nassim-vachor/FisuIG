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

    
    @IBOutlet weak var register: UIBarButtonItem!
    
   
    @IBOutlet weak var theSwitch: UISwitch!
 
    @IBAction func switchOnOff(sender: AnyObject) {
    
        if theSwitch.on {
            Activity.updateData(1, KeyPath: "selected", id: (receved?.idAct)! )
            
        }
        else {
            Activity.updateData( 0, KeyPath: "selected", id: (receved?.idAct)!)
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
        
        let myString:NSString = "About This Event : \(act.descriptionAct!)"
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName : UIFont( name: "Georgia" , size: 15.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 19))
         myMutableString.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 19))
        DescLabel.attributedText = myMutableString
        
        /*
        let colors = "<font size = 4><font color = red>About This Event :</font>+\(act.descriptionAct!)"
        DescLabel.text = "\(colors)"
        let encoding = colors.dataUsingEncoding(NSUTF8StringEncoding)!
        let options = [NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType]
        do {
            let string =  try! NSAttributedString(data: encoding, options: options, documentAttributes: nil)
            DescLabel.attributedText = string
        
        }*/
           // DescLabel.text = "About This Event : \(act.descriptionAct!)"
        
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
        
        // Modification de la couleur du label de Location Map
        
        
        let myString2:NSString = "Location Map : \((act.isLocated3!).nomLoc!)"
        var myMutableString2 = NSMutableAttributedString()
        
        myMutableString2 = NSMutableAttributedString(string: myString2 as String, attributes: [NSFontAttributeName : UIFont( name: "Georgia" , size: 15.0)!])
        myMutableString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 15))
        myMutableString2.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 15.0)!, range: NSRange(location: 0, length: 15))
         adresseLabel?.attributedText = myMutableString2

        
            //adresseLabel?.text = "Location Map : \((act.isLocated3!).nomLoc!)"
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
