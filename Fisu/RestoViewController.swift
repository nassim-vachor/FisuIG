//
//  RestoViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class RestoViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var resto = [ Restaurant]()
    

    @IBAction func home(sender: AnyObject) {
         self.navigationController?.dismissViewControllerAnimated(true, completion: nil )
    }

    @IBOutlet weak var restoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let fetchRequest = NSFetchRequest ( entityName: "Restaurant")
     
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Restaurant]
            resto = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        self.restoTableView.delegate = self
        self.restoTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return resto.count
        
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("RestoId", forIndexPath: indexPath) as! RestoTableViewCell
        //on force le downCast avec
        
        cell.restoLabel.text = resto[indexPath.row].nameRes
        cell.restoImage.image = UIImage( data: (resto[indexPath.row].photoRes)!, scale: 0.1)
        cell.restoHorLabel.text = (resto[indexPath.row].getTimeDeb())+" - \(resto[indexPath.row].getTimeFin())"
       
        return cell
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let index1 = self.restoTableView.indexPathForSelectedRow?.row
        {
            
            if let identifier = segue.identifier{
                switch identifier{
                case "restoSegue":
                    let SecondVC = segue.destinationViewController as! DisplayRestoViewController
                    
                    SecondVC.receved = self.resto[index1]
                   
                    
                default: break
                }
            }
            
            
        }}

}
