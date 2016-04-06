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
        
       nomLabel.text = (receved2!.surname)! + "  " + (receved2!.name)!
        phoneLabel.text = "Phone : \(receved2!.phone!)"
        Image.image = UIImage(data: (receved2?.photoSpe)!, scale: 0.1)
        biographyLabel.text = "Biography: \(receved2!.biography!)"
  
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
