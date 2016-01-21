//
//  RemoveCategorieTableController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit



class EditCategorieTableController: UITableViewController {
    
    var categorie : [Categoria]!
    var saveAction : AnyObject?
    
    override func viewDidLoad() {
        self.editButtonItem().title = "Modifica"
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
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
//        let img = UIImage(named: String(indexPath.row + 1))
//        cell.imageView?.image = img?.imageWithInsets(10).imageWithRenderingMode(.AlwaysTemplate)
//        cell.imageView?.contentMode = .ScaleAspectFit
//        cell.imageView?.tintColor = self.view.tintColor
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

    
    @available(iOS 8.0, *)
    @IBAction func addCategoria(sender: UIBarButtonItem) {
        var tField: UITextField!
        
        saveAction = UIAlertAction(title: "Salva", style: UIAlertActionStyle.Default, handler:{ (UIAlertAction)in
            do{
                try Categoria.save(tField.text!, padre: nil)
                self.tableView.reloadData()
            }catch{}
        })
        
        let cancelAction = UIAlertAction(title: "Annulla", style: UIAlertActionStyle.Cancel, handler:nil)
        let ac = saveAction as? UIAlertAction
        ac?.enabled = false
        
        func configurationTextField(textField: UITextField!){
            textField.placeholder = "Nome"
            textField.addTarget(self, action: "isSavable:", forControlEvents: UIControlEvents.EditingChanged)
            textField.autocapitalizationType = .Sentences
            tField = textField
        }
        
        let alert = UIAlertController(title: "Aggiungi categoria", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        alert.addTextFieldWithConfigurationHandler(configurationTextField)
        alert.addAction(cancelAction)
        alert.addAction(saveAction as! UIAlertAction)
        
        self.presentViewController(alert, animated: true, completion: {
            
        })
    }
    
    @available(iOS 8.0, *)
    func isSavable(sender: UITextField){
        let ac = saveAction as! UIAlertAction
        ac.enabled = sender.text != nil && sender.text != ""
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        if editing{
            self.editButtonItem().title = "Fine"
        }else{
            self.editButtonItem().title = "Modifica"
        }
    }
    
    @IBAction func close(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}
