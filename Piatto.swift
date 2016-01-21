//
//  Piatto.swift
//  iPlate
//
//  Created by Francesco Thiery on 07/01/16.
//  Copyright © 2016 Francesco. All rights reserved.
//

import Foundation
import CoreData


class Piatto: NSManagedObject {

    static var fetchRequest : NSFetchRequest {
        get {
            return Helper.fetchRequestForEntityAndKeyDescriptor("Categoria", keyDescriptor: "nome")
        }
    }
    
    static var managedObjectContext : NSManagedObjectContext {
        get {
            return Helper.managedObjectContext
        }
    }
    
    

}
