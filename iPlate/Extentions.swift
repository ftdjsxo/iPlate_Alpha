//
//  extention.swift
//  iPlate
//
//  Created by Francesco on 09/12/15.
//  Copyright © 2015 Francesco. All rights reserved.
//

import UIKit

extension UIViewController{
    
    func getDefaultTextFieldDelegate() -> DefaultTextFieldDelegate{
        let dTFDel = DefaultTextFieldDelegate()
        dTFDel.view = self.view
        return dTFDel
    }
    
    func dismissView(sender: AnyObject){
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}