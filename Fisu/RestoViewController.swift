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
        let cell = tableView.dequeueReusableCellWithIdentifier("RestoId", forIndexPath: indexPath) as!  RestoTableViewCell
        //on force le downCast avec
        
        cell.restoLabel.text = resto[indexPath.row].nameRes
        cell.restoImage.image = UIImage( data: (resto[indexPath.row].photoRes)!, scale: 0.1)
        cell.restoHorLabel.text = (resto[indexPath.row].getTimeDeb())+" - \(resto[indexPath.row].getTimeFin())"
       
        return cell
    }
///hhhkkkk

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
