//
//  Categoria.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import Foundation
import CoreData


class Categoria: NSManagedObject {

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
    
    static func listCategorie() throws -> [Categoria]{
        var lista = [Categoria]()
        lista = try managedObjectContext.executeFetchRequest(Categoria.fetchRequest) as! [Categoria]
        return lista
    }
    
    static func save(nome: String, padre: Categoria?)throws -> Categoria?{
        
        do {
            let lista =  try  listCategorie();
            for ct in lista{
                if ct.nome == nome{
                   return ct
                }
            }
        }catch {
            throw error
        }

        
        let categoriaDescription = NSEntityDescription.entityForName("Categoria", inManagedObjectContext: managedObjectContext)
        let categoria = Categoria(entity: categoriaDescription!, insertIntoManagedObjectContext: managedObjectContext)
        categoria.nome = nome
        categoria.padre = padre
        
        
        do {
            try managedObjectContext.save()
        } catch {
            throw error
        }
        
        return categoria
    }
    
    static func removeCategoria(categoria :Categoria) throws{
        managedObjectContext.deleteObject(categoria)
        do{
            let lista = try listCategorie()
            for elemento in lista{
                if elemento.padre == categoria{
                    managedObjectContext.deleteObject(elemento)
                }
            }
            
            //GARBAGE CLEAN: Rimuove gli alimenti che puntavano a quella categoria, altrimenti non sarebbero stati mai accessibili di nuovo
          let listaAlim = try Alimento.listaAlimentiPerCategoria(categoria)
            for al in listaAlim {
                Alimento.removeAlimento(al)
            }
        }catch {
            throw error
        }
    }

}
