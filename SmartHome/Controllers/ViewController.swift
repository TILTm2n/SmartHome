//
//  ViewController.swift
//  SmartHome
//
//  Created by Eugene on 21.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var DoorsButton: UIButton!
    
    var camViews: [CameraView] = [
        CameraView(cameraView: UIImage(named: "sunset")!, icon: UIImage(named: "sunset")!, title: "Title", detail: "detail")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTypeCell", for: indexPath) as! FirstTypeTableViewCell
        
        cell.imageCamera.image = camViews[indexPath.row].cameraView
        cell.title.text = camViews[indexPath.row].title
        cell.detail.text = camViews[indexPath.row].detail
        cell.iconCamera.image = camViews[indexPath.row].icon
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
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

