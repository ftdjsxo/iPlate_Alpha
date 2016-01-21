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

extension UIImage {
    func imageWithInsets(insetDimen: CGFloat) -> UIImage {
        return imageWithInset(UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    func imageWithInset(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSizeMake(self.size.width + insets.left + insets.right,
                self.size.height + insets.top + insets.bottom), false, self.scale)
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.drawAtPoint(origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return imageWithInsets
    }
}