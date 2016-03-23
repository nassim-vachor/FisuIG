//
//  Accomodation+CoreDataProperties.swift
//  Fisu
//
//  Created by Nassim VACHOR on 17/03/2016.
//  Copyright © 2016 Nassim VACHOR. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Accomodation {

    @NSManaged var descAcco: String?
    @NSManaged var idAcco: NSNumber?
    @NSManaged var name: String?
    @NSManaged var phoneAcco: String?
    @NSManaged var photoA: String?
    @NSManaged var isLocated: Location?

}
