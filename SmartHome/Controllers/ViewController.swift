//
//  ViewController.swift
//  SmartHome
//
//  Created by Eugene on 21.12.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var DoorsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CameraButton.addBorder(side: .Bottom, color: UIColor.red, width: 2.0)
        DoorsButton.addBorder(side: .Bottom, color: UIColor.blue, width: 2.0)
        
    }

    
    
    
    
}

