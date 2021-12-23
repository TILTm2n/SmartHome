//
//  ViewController.swift
//  SmartHome
//
//  Created by Eugene on 21.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTypeCell", for: indexPath) as! FirstTypeTableViewCell
        
        cell.imageCamera.image = UIImage(named: "sunset")
        cell.title.text = "pososi"
        cell.detail.text = "пососи еще"
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 20
//    }
    

    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var DoorsButton: UIButton!
    
    var currentButton = 1
    
    @IBAction func CamButtonAction(_ sender: Any) {
        currentButton = 1
        changeCurrentWindow()
    }
    @IBAction func DoorButtonAction(_ sender: Any) {
        currentButton = 2
        changeCurrentWindow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CameraButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
    }
    
    func changeCurrentWindow(){
        if (currentButton == 1){
            CameraButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
            DoorsButton.removeBorder()
        }
            
        if (currentButton == 2){
            DoorsButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
            CameraButton.removeBorder()
        }
    }
    

}

