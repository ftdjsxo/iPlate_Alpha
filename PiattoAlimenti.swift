//
//  PiattoAlimenti.swift
//  iPlate
//
//  Created by Francesco Thiery on 07/01/16.
//  Copyright © 2016 Francesco. All rights reserved.
//

import Foundation
import CoreData


class PiattoAlimenti: NSManagedObject {

//    static var fetchRequestAlimento : NSFetchRequest {
//        get {
//            return Helper.fetchRequestForEntityAndKeyDescriptor("Alimento", keyDescriptor: "nome")
//        }
//    }
//    
//    static var fetchRequestPiattoAlimenti(
    
    static var managedObjectContext : NSManagedObjectContext {
        get {
            return Helper.managedObjectContext
        }
    }
    
    func getListaAlimentiFromPiatto(piatto :Piatto){
        let alimenti =  Array<Alimento>()
    
    }

}
