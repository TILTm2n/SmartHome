//
//  Button.swift
//  SmartHome
//
//  Created by Eugene on 21.12.2021.
//

import Foundation
import UIKit

enum UIButtonBorderSide{
    case Top, Bottom, Left, Rigth
}

extension UIButton{
    
    func addBorder(side: UIButtonBorderSide, color: UIColor, width: CGFloat){
        let border = CALayer()
        
        border.name = "borderLayer"
        border.backgroundColor = color.cgColor
        
        switch side{
            case .Top: border.frame = CGRect(x: 0, y: 0, width: self.frame.size.width, height: width)
            case .Bottom: border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: width)
            case .Left: border.frame = CGRect(x: 0, y: 0, width: width, height: self.frame.size.height)
            case .Rigth: border.frame = CGRect(x: self.frame.size.width - width, y: 0, width: width, height: self.frame.size.height)
        }
        
        self.layer.addSublayer(border)
    }
    
    func removeBorder(){
        for item in self.layer.sublayers!{
            if item.name == "borderLayer"{
                item.removeFromSuperlayer()
            }
        }
    }
    
}
