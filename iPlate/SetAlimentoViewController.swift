//
//  SetAlimentoViewController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

struct AlimentoAndSubtot {
    var alimento : Alimento
    var subTot : Double
    var grammi : Double
}

class SetAlimentoViewController: UIViewController {
    
    var grammi: Double?
    var pPGrammo: Double?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var subTotale: UILabel!
    var alimento: Alimento!
    var numDel = NumericFieldDelegate()
    
    override func viewDidLoad() {
        self.navigationItem.title = self.alimento.nome
        self.navigationController?.navigationBar.tintColor = self.subTotale.tintColor
        self.textField.delegate = self.numDel
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Save"), landscapeImagePhone: nil, style: UIBarButtonItemStyle.Plain, target: self, action: "onSalva:")
        self.textField.becomeFirstResponder()
    }
    
    func onSalva(sender: AnyObject) {
        if grammi != nil && pPGrammo != nil {
            self.dismissViewControllerAnimated(true, completion: nil)
            Helper.addAlimentoToPiatto(self.alimento, subTot: (pPGrammo! * grammi!), grammi: grammi!)
        }else{
            if #available(iOS 8.0, *) {
                let alert =  UIAlertController(title: "Ops :(", message: "Errore di convalida: Uno o più campi non sono stati inseriti correttamente", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "Continua", style: .Default, handler: nil))
                 self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func valueChange(sender: UITextField) {
        
        if sender.text != nil && sender.text != ""{
            self.grammi = sender.text!.toDouble()
            self.pPGrammo = self.alimento.prezzo!.doubleValue/1000.0
            self.subTotale.text = "Subtotale: " + String(pPGrammo! * grammi!) + "€"
        }else{
            self.subTotale.text = "Subtotale: 0€"
        }
    }
}
