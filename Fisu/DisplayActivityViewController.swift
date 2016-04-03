//
//  DisplayActivityViewController.swift
//  Fisu
//
//  Created by nassim on 27/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData
class DisplayActivityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    @IBOutlet weak var activityTableView: UITableView!
    var receved: Day? = nil
     var act = [ Activity ]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityTableView.delegate = self
          self.activityTableView.dataSource = self
        let fetchRequest = NSFetchRequest ( entityName: "Activity")
        let predicat = NSPredicate(format: "dayIs=%@", receved!)
        fetchRequest.predicate = predicat
        // fetchRequest.returnsDistinctResults = true
        //    fetchRequest.propertiesToFetch = ["dayIs"]
        //fetchRequest.propertiesToGroupBy = ["dayIs"]
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Activity]
            act = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return act.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cellAct", forIndexPath: indexPath) as!
        DisplayActivityTableViewCell  //on force le downCast avec
        
        cell.ActivityLabel.text = act[indexPath.row].nomAct
        cell.activityImage.image = UIImage(data: (act[indexPath.row].photoActi)!, scale: 0.1)
        cell.heureLabel.text = (act[indexPath.row].getTimeDeb())+" - \(act[indexPath.row].getTimeFin())"
        
        
    
        
        return cell
    }
    
    
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.activityTableView.indexPathForSelectedRow?.row
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "ActSegue":
                    let SecondVC = segue.destinationViewController as! DetailActivityViewController
                    
                    SecondVC.receved = self.act[index1]
                    
                default: break
                }
            }
            
            
        }}

}
