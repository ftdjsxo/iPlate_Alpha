//
//  AlimentiInventarioTableController.swift
//  iPlate
//
//  Created by Francesco on 09/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class AlimentiInventarioTableController: AlimentiTableController {
    var currentAlimento : Alimento?
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            do{
                let alimenti = try Alimento.listaAlimentiPerCategoria(categorie[indexPath.section])
                let alimento = alimenti[indexPath.row]
                Alimento.removeAlimento(alimento)
                tableView.reloadData()
            }catch{
                
            }
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        do{
            let alimenti = try Alimento.listaAlimentiPerCategoria(categorie[indexPath.section])
            currentAlimento = alimenti[indexPath.row]
            performSegueWithIdentifier("aggiornaSegue", sender: nil)
        }catch{}
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? AlimentoViewController
            where segue.identifier == "aggiornaSegue"{
            vc.alimento = currentAlimento
        }
        
    }


}
