//
//  AlimentoPiattoCell.swift
//  iPlate
//
//  Created by Francesco on 08/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class AlimentoPiattoCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var textField: UITextField!
    var subTotLabel: UILabel?
    var alimento: Alimento!
    
    func getSubTot() -> Double{
        if textField.text == nil && textField.text == ""{
            return 0.0
        }
        let pPGrammo = self.alimento.prezzo!.doubleValue / 1000
        return pPGrammo * textField.text!.toDouble()!
    }
    
}
