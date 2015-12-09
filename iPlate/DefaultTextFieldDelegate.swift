//
//  DefaultTextFieldDelegate.swift
//  iPlate
//
//  Created by Francesco on 09/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class DefaultTextFieldDelegate : NSObject, UITextFieldDelegate {
    
    var view: UIView?
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.view?.endEditing(true)
        return true
    }
    
}