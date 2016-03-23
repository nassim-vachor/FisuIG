//
//  Speaker+CoreDataProperties.swift
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

extension Speaker {

    @NSManaged var biography: String?
    @NSManaged var idSpeaker: NSNumber?
    @NSManaged var name: String?
    @NSManaged var phone: String?
    @NSManaged var photoSpe: NSData?
    @NSManaged var surname: String?
    @NSManaged var participate: NSSet?

}
