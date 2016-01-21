//
//  PlateAlimentiTableViewController.swift
//  iPlate
//
//  Created by Francesco Thiery on 06/01/16.
//  Copyright © 2016 Francesco. All rights reserved.
//

import UIKit

class PlateAlimentiTableViewController: AlimentiInventarioTableController {
    
    override func viewDidLoad() {
        self.navigationItem.leftBarButtonItem = editButtonItem()
        editButtonItem().title = "Modifica"
    }
  
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? DetailAlimentoNavController
            where segue.identifier == "aggiornaSegue"{
                vc.alimento = currentAlimento
        }
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing{
            self.editButtonItem().title = "Fine"
        }else{
            self.editButtonItem().title = "Modifica"
        }
    }

}
