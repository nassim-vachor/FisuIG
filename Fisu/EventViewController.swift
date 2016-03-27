//
//  EventViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class EventViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var days = [ Day ]()
    
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest ( entityName: "Day")
        // fetchRequest.returnsDistinctResults = true
        //    fetchRequest.propertiesToFetch = ["dayIs"]
        //fetchRequest.propertiesToGroupBy = ["dayIs"]
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Day]
            days = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return days.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DayId", forIndexPath: indexPath) as!
        ScheduleTableViewCell  //on force le downCast avec
        
        cell.dayLabel.text = days[indexPath.row].day
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.myTableView.indexPathForSelectedRow?.row
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "firstSegue":
                    let SecondVC = segue.destinationViewController as! DisplayActivityViewController
                    
                    SecondVC.receved = self.days[index1]
                    
                default: break
                }
            }
            
            
        }}
}