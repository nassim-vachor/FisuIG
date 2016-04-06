//
//  EventViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var frc : NSFetchedResultsController = NSFetchedResultsController()
    
    
    @IBAction func home(sender: AnyObject) {
        self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        frc = Day.getDayFetchedResultController("Day", key: "keyDay")
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("DayId", forIndexPath: indexPath) as!
        ScheduleTableViewCell  //on force le downCast avec
        
        let jour = frc.objectAtIndexPath(indexPath) as! Day
        cell.dayLabel.text = jour.day
        //days[indexPath.row].day
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.myTableView.indexPathForSelectedRow
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "firstSegue":
                    let SecondVC = segue.destinationViewController as! DisplayActivityViewController
                    let daySelected = self.frc.objectAtIndexPath(index1) as! Day
                    
                    SecondVC.receved = daySelected
                    
                default: break
                }
            }
            
            
        }
    }
    
}