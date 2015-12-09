//
//  CategorieViewController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

@objc
protocol CategorieTableViewControllerDelegate{
    optional func didSelectCategoria(categoria :Categoria)
}

class CategorieTableViewController: UITableViewController {
    
    var categorie : [Categoria]!
    var categoria : Categoria?
    var delegate : CategorieTableViewControllerDelegate?
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        do{
            categorie = try Categoria.listCategorie()
            return categorie.count
        }catch{
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let categoria = categorie[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("plainCell")! as UITableViewCell
        
        if categoria == self.categoria{
            self.delegate?.didSelectCategoria?(self.categoria!)
            cell.accessoryType = .Checkmark
            self.tableView.selectRowAtIndexPath(indexPath, animated: true, scrollPosition: UITableViewScrollPosition.None);
        }
        
        cell.textLabel?.text = categoria.nome
        return cell
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.Checkmark
        let categoria = categorie[indexPath.row]
        delegate?.didSelectCategoria?(categoria)
    }
    
    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.accessoryType = UITableViewCellAccessoryType.None
    }
    
}
