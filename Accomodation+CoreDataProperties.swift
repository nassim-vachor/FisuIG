//
//  Accomodation+CoreDataProperties.swift
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

extension Accomodation {

    @NSManaged var descAcco: String?
    @NSManaged var idAcco: NSNumber?
    @NSManaged var name: String?
    @NSManaged var phoneAcco: String?
    @NSManaged var photoA: NSData?
    @NSManaged var ouverture: NSDate?
    @NSManaged var fermeture: NSDate?
    @NSManaged var isLocated: Location?

}
