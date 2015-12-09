//
//  SelectAlimentiTableController.swift
//  iPlate
//
//  Created by Francesco on 09/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class SelectAlimentiTableController: AlimentiTableController {

    var setAlimentoViewController : SetAlimentoViewController?
        var currentAlimento : Alimento?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? SetAlimentoViewController
            where segue.identifier == "aliment" {
                self.setAlimentoViewController = vc
                vc.alimento = currentAlimento
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        do{
            let alimenti = try Alimento.listaAlimentiPerCategoria(categorie[indexPath.section])
            let alimento = alimenti[indexPath.row]
            self.currentAlimento = alimento
            performSegueWithIdentifier("aliment", sender: self )
        }catch{
            
        }
    }
    
}
