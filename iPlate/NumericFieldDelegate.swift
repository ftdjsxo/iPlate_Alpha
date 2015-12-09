//
//  NumericFieldDelegate.swift
//  iPlate
//
//  Created by Francesco on 09/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

class NumericFieldDelegate: NSObject, UITextFieldDelegate {
    
    var countryCode = NSLocale.currentLocale().objectForKey(NSLocaleCountryCode)
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {

        let strAllw = "0123456789,"
//        var char : Character
//        
//        if countryCode as? String == "it"{
//            char = ","
//        }else{
//            char = "."
//        }
//        
//        strAllw.append(char)
        
        // Create an `NSCharacterSet` set which includes everything *but* the digits
        let inverseSet = NSCharacterSet(charactersInString: strAllw ).invertedSet
        
        // At every character in this "inverseSet" contained in the string,
        // split the string up into components which exclude the characters
        // in this inverse set
        let components = string.componentsSeparatedByCharactersInSet(inverseSet)
        
        // Rejoin these components
        let filtered = components.joinWithSeparator("")  // use join("", components) if you are using Swift 1.2
        
        // If the original string is equal to the filtered string, i.e. if no
        // inverse characters were present to be eliminated, the input is valid
        // and the statement returns true; else it returns false
        return string == filtered
    }

}
