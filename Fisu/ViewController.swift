//
//  ViewController.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController {
    
  

    override func viewDidLoad() {
        super.viewDidLoad()
        //initialisation de la BD grace à la methode initDB
        InitDB.initialisationDB()
    }
   override func viewWillAppear(animated: Bool) {
        navigationController?.navigationBarHidden = true
        super.viewWillAppear(animated)
    }
    override func viewWillDisappear(animated: Bool) {
        if (navigationController?.topViewController != self){
            navigationController?.navigationBarHidden = false
        
        }
        super.viewWillDisappear(animated)
        
        
    }
  
    @IBAction func start(sender: AnyObject) {
     
    }
    @IBOutlet weak var backg: UIImageView!

    @IBOutlet weak var logo: UIImageView!
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

