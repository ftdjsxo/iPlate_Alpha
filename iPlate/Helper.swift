//
//  Helper.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit
import CoreData

class Helper: NSObject {
    
    static var alimentiPiatto = [AlimentoAndSubtot]()
    
    static var managedObjectContext : NSManagedObjectContext {
        get {
            return (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        }
    }
    
    static func fetchRequestForEntityAndKeyDescriptor(entityName: String, keyDescriptor: String) -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        let sortDescriptor = NSSortDescriptor(key: keyDescriptor, ascending: true)
        let sortDescriptors = NSArray(objects: sortDescriptor)
        fetchRequest.sortDescriptors = sortDescriptors as? [NSSortDescriptor]
        return fetchRequest
    }
    
    static func addAlimentoToPiatto(alimento : Alimento, subTot: Double, grammi: Double){
        let al = AlimentoAndSubtot(alimento: alimento, subTot: subTot, grammi: grammi)
        alimentiPiatto.append(al)
    }
    
    
}