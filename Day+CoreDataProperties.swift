
//
//  Day+CoreDataProperties.swift
//  Fisu
//
//  Created by nassim on 26/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Day {

    @NSManaged var keyDay: NSNumber?
    @NSManaged var day: String?
    @NSManaged var dayActivity: NSSet?

}
