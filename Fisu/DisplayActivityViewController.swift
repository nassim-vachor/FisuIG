//
//  DisplayActivityViewController.swift
//  Fisu
//
//  Created by nassim on 27/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
class DisplayActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var activityTableView: UITableView!
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    var receved: Day? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // get all activity for day = receved ( the day selected in the previous view)
        frc = Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "dayIs=%@", args: receved!)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        self.activityTableView.delegate = self
        self.activityTableView.dataSource = self
        
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("cellAct", forIndexPath: indexPath) as!
        DisplayActivityTableViewCell  //on force le downCast avec
        let act = frc.objectAtIndexPath(indexPath) as! Activity
        
        cell.ActivityLabel.text = act.nomAct     //act[indexPath.row].nomAct
        cell.activityImage.image = UIImage(data: (act.photoActi)!, scale: 0.1)
        cell.heureLabel.text = (act.getTimeDeb())+" - \(act.getTimeFin())"
        
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.activityTableView.indexPathForSelectedRow
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "ActSegue":
                    let SecondVC = segue.destinationViewController as! DetailActivityViewController
                    let act = frc.objectAtIndexPath(index1) as! Activity
                    SecondVC.receved = act
                    
                default: break
                }
            }
            
            
        }}
    
}
