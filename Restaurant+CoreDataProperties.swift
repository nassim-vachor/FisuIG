//
//  Restaurant+CoreDataProperties.swift
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

extension Restaurant {

    @NSManaged var hourdeb: NSDate?
    @NSManaged var hourFin: NSDate?
    @NSManaged var idRes: NSNumber?
    @NSManaged var nameRes: String?
    @NSManaged var phoneRes: String?
    @NSManaged var photoRes: NSData?
    @NSManaged var speciality: String?
    @NSManaged var isLocated2: Location?

}
