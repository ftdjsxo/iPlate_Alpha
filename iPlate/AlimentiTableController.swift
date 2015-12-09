//
//  AlimentiTableController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class AlimentiTableController: UITableViewController {
    
    
    var categorie : [Categoria]!
    

    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        do{
            categorie = try Categoria.listCategorie()
            return categorie.count
        }catch{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do{
            categorie = try Categoria.listCategorie()
            return try Alimento.listaAlimentiPerCategoria(categorie[section]).count
        }catch{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("plainCell")! as UITableViewCell
        do{
            let alimenti = try Alimento.listaAlimentiPerCategoria(categorie[indexPath.section])
            let alimento = alimenti[indexPath.row]
            cell.textLabel?.text =  alimento.nome
            cell.detailTextLabel?.text = (alimento.prezzo?.stringValue)! + " €/Kg"
        }catch{}
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        do{
            let categs = try Categoria.listCategorie()
            return categs[section].nome
        }catch{
            return nil
        }
    }
    
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0
    }
    
    @IBAction func onDismiss(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
