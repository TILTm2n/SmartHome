//
//  ViewController.swift
//  SmartHome
//
//  Created by Eugene on 21.12.2021.
//

import UIKit
import CloudKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var CameraButton: UIButton!
    @IBOutlet weak var DoorsButton: UIButton!
    @IBOutlet weak var mainCamerasTitle: UILabel!
    
    var camViews: [CameraView] = [
        CameraView(cameraView: "", icon: "icon", title: "Title", detail: "detail"),
        CameraView(cameraView: "sunrise", icon: "", title: "Title", detail: "")
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return camViews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTypeCell", for: indexPath) as! FirstTypeTableViewCell
        
        
        if !camViews[indexPath.row].cameraView!.isEmpty{
            cell.imageCamera.image = UIImage(named: camViews[indexPath.row].cameraView!)
        }else{
            cell.imageCamera.isHidden = true
        }
        
        if !camViews[indexPath.row].icon!.isEmpty{
            cell.iconCamera.image = UIImage(named: camViews[indexPath.row].icon!)
        }else{
            cell.iconCamera.isHidden = true
        }
        
        if !camViews[indexPath.row].title!.isEmpty{
            cell.title.text = camViews[indexPath.row].title
        }else{
            cell.title.isHidden = true
        }
        
        if !camViews[indexPath.row].detail!.isEmpty{
            cell.detail.text = camViews[indexPath.row].detail
        }else{
            cell.detail.isHidden = true
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    var currentButton = 1
    
    @IBAction func CamButtonAction(_ sender: Any) {
        currentButton = 1
        mainCamerasTitle.isHidden = false
        changeCurrentWindow()
    }
    @IBAction func DoorButtonAction(_ sender: Any) {
        currentButton = 2
        mainCamerasTitle.isHidden = true
        changeCurrentWindow()
    }
    
    //MARK: - viewDidLoad
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: nil) { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            print("edited")
        }
        
        //edit.backgroundColor = UIColor.white
        edit.image = UIImage(named: "editIcon")
        
        
//        let deleted = UIContextualAction(style: .destructive, title: "Delete") { (contextualAction, view, actionPerformed: (Bool) -> ()) in
//            print("deleted")
//        }
        
        return UISwipeActionsConfiguration(actions: [edit])
    }
    

}

