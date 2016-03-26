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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
                return days.count
      
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DayId", forIndexPath: indexPath) as!
        ScheduleTableViewCell  //on force le downCast avec
        /*switch indexPath.row{
        
        case 0:
        
        cell.myCellLabel.text = self.voy3.nom
        
        case 1:
        cell.myCellLabel.text = self.voy4.nom
        case 2:
        cell.myCellLabel.text = self.voy5.nom
        default:
        
        cell.myCellLabel.text = self.myData[indexPath.row-self.ens.tableau.count]
        
        }*/
        
        // for ( var i = 0; i<indexPath.row; i++){
     
        cell.dayLabel.text = days[indexPath.row].day
       
       
        //mmmmmmmm
        // nassim est un boti et il se ùmet facilement en colere et apres il me frappe hum
        
        //}
        
        
        //cell.myCellLabel.text = "other item"
        return cell
    }
    
   /* func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let  headerCell = tableView.dequeueReusableCellWithIdentifier("HeaderCell") as! CustomHeaderCell
        headerCell.backgroundColor = UIColor.lightGrayColor()
        
        
        headerCell.headerLabel.text =  ens.tableau[section].nom
        
        /*switch (section) {
        case 0:
        headerCell.headerLabel.text = "Europe";
        //return sectionHeaderView
        case 1:
        headerCell.headerLabel.text = "Asia";
        //return sectionHeaderView
        case 2:
        headerCell.headerLabel.text = "South America";
        //return sectionHeaderView
        default:
        headerCell.headerLabel.text = "Other";
        }*/
        
        return headerCell
        
    }
    */
    

}