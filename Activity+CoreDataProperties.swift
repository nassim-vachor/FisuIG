//
//  Activity+CoreDataProperties.swift
//  Fisu
//
//  Created by nassim on 19/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activity {

    @NSManaged var dateDeb: NSDate?
    @NSManaged var dateFin: NSDate?
    @NSManaged var descriptionAct: String?
    @NSManaged var idAct: NSNumber?
    @NSManaged var nomAct: String?
    @NSManaged var photoActi: NSData?
    @NSManaged var selected: NSNumber?
    @NSManaged var isLocated3: Location?
    @NSManaged var isPresented: Speaker?

}
