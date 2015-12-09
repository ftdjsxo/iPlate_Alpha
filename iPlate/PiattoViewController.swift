//
//  PiattoViewController.swift
//  iPlate
//
//  Created by Francesco on 07/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class PiattoViewController: UIViewController, ListaAlimentiPiattoDelegate {

    @IBOutlet weak var totale: UILabel!
    
    var embeddedController : ListaAlimentiPiattoTableController!

    override func viewWillAppear(animated: Bool) {
        self.updateTotal()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if let vc = segue.destinationViewController as? ListaAlimentiPiattoTableController
            where segue.identifier == "EmbeddedSegue" {
                self.embeddedController = vc
                self.embeddedController.delegate = self
        }
    }
    
    func didEndEditing() {
        self.updateTotal()
    }
    
    @IBAction func close(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    private func updateTotal(){
        var tot = 0.0
        for aP in  Helper.alimentiPiatto{
            tot += aP.subTot
        }
        self.totale.text = "Totale: "  + String(tot) + "€"
    }
    
}
