//
//  AlimentoViewController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

extension String {
    func toDouble() -> Double? {
        let formatter = NSNumberFormatter()
        formatter.maximumFractionDigits = 2
        return  formatter.numberFromString(self)?.doubleValue
    }
}

class AlimentoViewController: UIViewController , CategorieTableViewControllerDelegate{
    @IBOutlet weak var nome: UITextField!
    @IBOutlet weak var prezzo: UITextField!
    @IBOutlet weak var containerController: CategorieTableViewController!
    var numericTXFieldDelegate = NumericFieldDelegate()
    var categoria: Categoria?
    var defaultTextFieldDelegate : DefaultTextFieldDelegate!
    
    var alimento : Alimento?
    
    override func viewDidLoad() {
        let tap = UITapGestureRecognizer(target: self, action: "dismissKeyBoard:")
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
        self.prezzo.delegate = self.numericTXFieldDelegate
        self.defaultTextFieldDelegate = getDefaultTextFieldDelegate()
        self.nome.delegate = self.defaultTextFieldDelegate
        
        if alimento != nil{
            self.title = "Aggiorna Alimento"
            self.nome.text = alimento?.nome
            self.nome.textColor = UIColor.lightGrayColor()
            self.nome.userInteractionEnabled = false
            self.prezzo.text = alimento?.prezzo?.stringValue.stringByReplacingOccurrencesOfString(".", withString: ",")
            self.containerController.categoria = self.alimento?.categoria as? Categoria
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? CategorieTableViewController
            where segue.identifier == "EmbedSegue" {
                self.containerController = vc
                self.containerController.delegate = self
        }
    }
    
    @IBAction func onSalva(sender: AnyObject) {
        if nomeNotBlank() && prezzoNotBlank() && categoria != nil{
            do{
                try Alimento.save(self.nome.text!, prezzo: prezzo.text!.toDouble()!, categoria: self.categoria!)
                self.navigationController?.popToRootViewControllerAnimated(true)
            }catch{
                print(error)
            }
        }else{
           if #available(iOS 8.0, *) {
               let alert =  UIAlertController(title: "Ops :(", message: "Errore di convalida: Uno o più campi non sono stati inseriti correttamente", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
           } 
        }
    }
    
    
    @IBAction func dismissKeyBoard(sender: AnyObject) {
         self.view.endEditing(true)
    }

    
    func didSelectCategoria(categoria: Categoria) {
        self.categoria = categoria
    }
    
    private func nomeNotBlank() -> Bool{
       return nome.text != "" && nome.text != nil
    }
    
    private func prezzoNotBlank() -> Bool{
        return prezzo.text != "" && prezzo.text != nil
    }
}
