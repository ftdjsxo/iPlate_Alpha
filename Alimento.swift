//
//  Alimento.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class Alimento: NSManagedObject {
    
    static var fetchRequest : NSFetchRequest {
        get {
            return Helper.fetchRequestForEntityAndKeyDescriptor("Alimento", keyDescriptor: "nome")
        }
    }
    
    static var managedObjectContext : NSManagedObjectContext {
        get {
            return Helper.managedObjectContext
        }
    }

    static func listAlimenti() throws -> [Alimento]{
        var lista = [Alimento]()
        lista = try managedObjectContext.executeFetchRequest(Alimento.fetchRequest) as! [Alimento]
        return lista
    }
    
    static func listaAlimentiPerCategoria(categoria : Categoria) throws -> [Alimento]{
        var lista = [Alimento]()
        var listaPerCategoria = [Alimento]()
        
        lista = try managedObjectContext.executeFetchRequest(Alimento.fetchRequest) as! [Alimento]
        
        for al in lista{
            if al.categoria == categoria{
                listaPerCategoria.append(al);
            }
        }
        
        return listaPerCategoria
    }
    
    static func save(){
        do{
            try managedObjectContext.save()
        }catch{
            print(error)
        }
    }
    
    static func save(nome: String, prezzo: Double, categoria: Categoria)throws -> Alimento?{
        
        do {
            let lista =  try  listAlimenti();
            for al in lista{
                if al.nome == nome && al.categoria == categoria{
                    managedObjectContext.deleteObject(al)
                }
            }
        }catch {
            throw error
        }
        
        let alimentoDescription = NSEntityDescription.entityForName("Alimento", inManagedObjectContext: managedObjectContext)
        let alimento = Alimento(entity: alimentoDescription!, insertIntoManagedObjectContext: managedObjectContext)
        alimento.nome = nome
        alimento.prezzo = prezzo
        alimento.categoria = categoria
    

        do {
            try managedObjectContext.save()
        } catch {
            throw error
        }
        
        return alimento
    }
    
    static func removeAlimento(alimento :Alimento) {
        managedObjectContext.deleteObject(alimento)
    }


}
