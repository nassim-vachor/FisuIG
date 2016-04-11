//
//  RestoViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class RestoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
     var frc : NSFetchedResultsController = NSFetchedResultsController()

    @IBAction func home(sender: AnyObject) {
         self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }

    @IBOutlet weak var restoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        frc = Restaurant.getRestoFetchedResultController("Restaurant", key: "idRes")
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        self.restoTableView.delegate = self
        self.restoTableView.dataSource = self
     
        
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
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestoId", forIndexPath: indexPath) as! RestoTableViewCell //on force le downCast avec
           let res = frc.objectAtIndexPath(indexPath) as! Restaurant
        cell.restoLabel.text = res.nameRes
        cell.restoImage.image = UIImage( data: (res.photoRes)!, scale: 0.1)
        cell.rating.image =  UIImage( data: (res.rating)!, scale: 1)
        cell.restoHorLabel.text = (res.getTimeDeb())+" - \(res.getTimeFin())"
       
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.restoTableView.indexPathForSelectedRow
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "restoSegue":
                    let SecondVC = segue.destinationViewController as! DisplayRestoViewController
                    let res = frc.objectAtIndexPath(index1) as! Restaurant
                    
                    SecondVC.receved = res
                   
                    
                default: break
                }
            }
            
            
        }}

}
