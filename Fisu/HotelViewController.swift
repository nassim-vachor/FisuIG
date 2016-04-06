//
//  HotelViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class HotelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
     var frc : NSFetchedResultsController = NSFetchedResultsController()
  
    
    
    @IBAction func home(sender: AnyObject) {
     
            self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
        
    }
    
    @IBOutlet weak var hotelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc = Accomodation.getAccoFetchedResultController("Accomodation", key: "idAcco")
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        self.hotelTableView.delegate = self
        self.hotelTableView.dataSource = self

    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let sections = frc.sections{
            return sections.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = frc.sections {
            let currentSection = sections[section]
            return currentSection.numberOfObjects
        }
        return 0
        //mm
    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HotelId", forIndexPath: indexPath) as!
        HotelTableViewCell  //on force le downCast avec
        let acco = frc.objectAtIndexPath(indexPath) as! Accomodation
        
        cell.hotelNomLabel.text = acco.name
        
        cell.hotelImage.image = UIImage( data: (acco.photoA)!, scale: 0.1)
        cell.hotelHorLabel.text = (acco.getTimeDeb())+" - \(acco.getTimeFin())"
        return cell
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.hotelTableView.indexPathForSelectedRow
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "hotelSegue":
                    let SecondVC = segue.destinationViewController as! DisplayHotelViewController
                          let acco = frc.objectAtIndexPath(index1) as! Accomodation
                    SecondVC.receved = acco
                    
                default: break
                }
            }
            
            
        }
    }
}
