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

class DetailActivityViewController: UIViewController {
  
    var receved: Activity? = nil
   // var receved2: Speaker? = nil
    var activity = [ Activity ]()
    

   
    @IBOutlet weak var theSwitch: UISwitch!
    
    @IBAction func switchOnOff(sender: AnyObject) {
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
      
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
 
     
        
      override func viewDidLoad() {
            super.viewDidLoad()
            let fetchRequest = NSFetchRequest( entityName: "Activity")
            let predicat = NSPredicate(format: "idAct=%@", (receved?.idAct)!)
            fetchRequest.predicate = predicat
            
            do {
                let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Activity]
                activity = fetchResult
                
                
                
            } catch let error as NSError{
                print("Could not fecth \(error), \(error.userInfo)")
                
            }
            NomActLabel.text = activity[0].nomAct
            DescLabel.text = "About This Event : \(activity[0].descriptionAct!)"
            //[descLabel.text.: "About This Restaurant" ]
            HeureActLabel.text = "\(activity[0].getDay())"
            horaireLabel.text = "\(activity[0].getTimeDeb())"+" - \(activity[0].getTimeFin())"
        
        
        if ( activity[0].isPresented == nil){
            speakLabel.hidden = true
            speakButton.hidden = true
            
            
        } else {
            speakLabel.text = "Speaker :  "
            let surname = activity[0].isPresented!.surname!
            let buttonTitle = String(surname[surname.startIndex]) + ". " + activity[0].isPresented!.name! + ""
            speakButton.setTitle(buttonTitle, forState: UIControlState.Normal)
        }
        
            adresseLabel?.text = "Location Map : \((activity[0].isLocated3!).address!)"
            imageAct.image = UIImage(data: (activity[0].photoActi)!, scale: 0.1)
            let location =  CLLocationCoordinate2D(latitude: CLLocationDegrees( (activity[0].isLocated3?.latitude)! ), longitude: CLLocationDegrees((activity[0].isLocated3?.longitude)! ))
            let span = MKCoordinateSpanMake(0.05, 0.05)
            let region = MKCoordinateRegion(center: location, span: span)
            actiMap.setRegion(region, animated: true)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            annotation.title = activity[0].isLocated3?.address!
            annotation.subtitle = "Montpellier"
            actiMap.addAnnotation(annotation)
        
            
            
            // Do any additional setup after loading the view.
    }
    

        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
