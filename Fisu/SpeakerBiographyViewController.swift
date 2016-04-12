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
       
        Image.image = UIImage(data: (receved2?.photoSpe)!, scale: 0.1)

        // Modification de la couleur du label phoneLabel
        let myString:NSString = "Phone : \(receved2!.phone!)"
        var myMutableString = NSMutableAttributedString()
        
        myMutableString = NSMutableAttributedString(string: myString as String, attributes: [NSFontAttributeName : UIFont( name: "Arial" , size: 16.0)!])
        myMutableString.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 7))
        myMutableString.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 16.0)!, range: NSRange(location: 0, length: 7))
        phoneLabel.attributedText = myMutableString
        
       // Modification de la couleur du label biographyLabel
        let myString2:NSString = "Biography: \(receved2!.biography!)"
        var myMutableString2 = NSMutableAttributedString()
        
        myMutableString2 = NSMutableAttributedString(string: myString2 as String, attributes: [NSFontAttributeName : UIFont( name: "Georgia" , size: 17.0)!])
        myMutableString2.addAttribute(NSForegroundColorAttributeName, value: UIColor.init(red: 128/255, green: 0/255, blue: 0/255, alpha: 1),range: NSRange(location: 0, length: 11))
        myMutableString2.addAttribute(NSFontAttributeName, value: UIFont( name: "Georgia-Bold" , size: 17.0)!, range: NSRange(location: 0, length: 11))
         biographyLabel.attributedText = myMutableString2


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
