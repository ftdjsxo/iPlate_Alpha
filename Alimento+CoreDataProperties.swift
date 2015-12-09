//
//  Alimento+CoreDataProperties.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Alimento {

    @NSManaged var nome: String?
    @NSManaged var prezzo: NSNumber?
    @NSManaged var categoria: NSManagedObject?

}
