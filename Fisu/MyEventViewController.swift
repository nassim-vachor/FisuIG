//
//  MyEventViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class MyEventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,NSFetchedResultsControllerDelegate  {
    var frc : NSFetchedResultsController = NSFetchedResultsController()
  
    
    
    @IBOutlet weak var myEventTableView: UITableView!
    @IBAction func home(sender: AnyObject) {
         self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.myEventTableView.delegate = self
        self.myEventTableView.dataSource = self
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reload:", name: "load", object: nil)
        // get all activity for day = receved ( the day selected in the previous view)
        frc = Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "selected=%@", args: true)
                frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
  
    
    }
    
    func reload ( notification: NSNotificationCenter){
        //clean the previous data for this view
        frc = Day.getActivityFetchedResultController("Activity", key: "idAct", predicat: "selected=%@", args: true)
        frc.delegate = self
        do {
            try frc.performFetch()
        } catch {
            print("An error occured")
        }
        self.myEventTableView.reloadData()
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
        let cell = tableView.dequeueReusableCellWithIdentifier("myEvent", forIndexPath: indexPath) as!
        MyEventTableViewCell  //on force le downCast avec
        let act = frc.objectAtIndexPath(indexPath) as! Activity
        
        cell.myLabel1.text = "\(act.getDay())"
        cell.myImage.image = UIImage(data: (act.photoActi)!, scale: 0.1)
        cell.myLabel2.text = act.nomAct
        cell.myLabel3.text = (act.getTimeDeb())+" - \(act.getTimeFin())"
        
        return cell
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.myEventTableView.indexPathForSelectedRow
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "myevent":
                    let SecondVC = segue.destinationViewController as! DetailActivityViewController
                    let act = frc.objectAtIndexPath(index1) as! Activity
                    SecondVC.receved = act
                    
                default: break
                }
            }
        }
    }


}
