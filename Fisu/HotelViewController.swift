//
//  HotelViewController.swift
//  Fisu
//
//  Created by nassim on 24/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData

class HotelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let managedObjectContext = ( UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    var hotels = [ Accomodation ]()
    

    
    
    
    @IBOutlet weak var hotelTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let fetchRequest = NSFetchRequest ( entityName: "Accomodation")
    
        do {
            let fetchResult = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Accomodation]
            hotels = fetchResult
            
            
            
        } catch let error as NSError{
            print("Could not fecth \(error), \(error.userInfo)")
            
        }
        self.hotelTableView.delegate = self
        self.hotelTableView.dataSource = self
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return hotels.count
        
    }
    
    //nnjjhjhjhhg
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("HotelId", forIndexPath: indexPath) as!
        HotelTableViewCell  //on force le downCast avec
        
        cell.hotelNomLabel.text = hotels[indexPath.row].name
        
        cell.hotelImage.image = UIImage( data: (hotels[indexPath.row].photoA)!, scale: 0.1)
        cell.hotelHorLabel.text = (hotels[indexPath.row].getTimeDeb())+" - \(hotels[indexPath.row].getTimeFin())"
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
