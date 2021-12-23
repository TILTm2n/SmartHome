//
//  UI.swift
//  SmartHome
//
//  Created by Eugene on 22.12.2021.
//

import Foundation
import UIKit

@IBDesignable extension UIView{
    
    @IBInspectable
    var borderRadius: CGFloat{
        get{
            return self.layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > borderRadius
        }
    }
    
}
