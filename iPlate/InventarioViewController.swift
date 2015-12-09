//
//  ViewController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class InventarioViewController: UIViewController {

    @IBOutlet weak var closeButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var numeroCategorie: UILabel!
    var defaultTXFDelegate : DefaultTextFieldDelegate?
    var containerController : AlimentiInventarioTableController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: "dismiss:")
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        
        self.defaultTXFDelegate = getDefaultTextFieldDelegate()
        textField.delegate = defaultTXFDelegate
    }
    
    override func viewWillAppear(animated: Bool) {
        self.setLabel()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func onClose(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func setLabel(){
        do{
            numeroCategorie.text = try "Numero di categorie: "+String(Categoria.listCategorie().count)
        }catch{
            print(error)
        }
    }

    @IBAction func aggiungi(sender: AnyObject) {
        if self.textField.text == "" || self.textField.text == nil{
            return
        }
        do{
            try Categoria.save(textField.text!, padre: nil)
            self.textField.text = ""
            self.containerController.tableView.reloadData()
        }catch{
            print(error)
        }
        self.setLabel()
    }
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? AlimentiInventarioTableController
            where segue.identifier == "embedded" {
                self.containerController = vc
        }
    }
    
    func dismiss(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }

}

