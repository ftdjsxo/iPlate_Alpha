//
//  RemoveCategorieTableController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit


class RemoveCategorieTableController: UITableViewController {
    
    var categorie : [Categoria]!
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = editButtonItem()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do{
            categorie = try Categoria.listCategorie()
            return categorie.count
        }catch{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("plainCell")! as UITableViewCell
        cell.textLabel?.text = categorie[indexPath.row].nome
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            do{
                try Categoria.removeCategoria(categorie[indexPath.row])
                tableView.reloadData()
            }catch{
                
            }
        }
    }
    
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
