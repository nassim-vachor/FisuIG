//
//  Location+CoreDataProperties.swift
//  Fisu
//
//  Created by Djeneba KANE on 07/04/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Location {

    @NSManaged var address: String?
    @NSManaged var idLoc: NSNumber?
    @NSManaged var latitude: NSNumber?
    @NSManaged var longitude: NSNumber?
    @NSManaged var nomLoc: String?
    @NSManaged var correspond: NSSet?
    @NSManaged var correspond2: NSSet?
    @NSManaged var correspond3: NSSet?

}
