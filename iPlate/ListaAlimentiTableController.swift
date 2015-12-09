//
//  ListaAlimentiTableController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

protocol ListaAlimentiPiattoDelegate{
    func didEndEditing()
}

class ListaAlimentiPiattoTableController: UITableViewController {
    
    var delegate : ListaAlimentiPiattoDelegate?
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("plainCell")! as UITableViewCell
        cell.textLabel!.text = Helper.alimentiPiatto[indexPath.row].alimento.nome
        cell.detailTextLabel?.text = String(Helper.alimentiPiatto[indexPath.row].subTot)
        return cell
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Helper.alimentiPiatto.count
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete{
            Helper.alimentiPiatto.removeAtIndex(indexPath.row)
            tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.Fade)
            delegate?.didEndEditing()
        }
    }

}
