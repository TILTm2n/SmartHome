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
    @IBOutlet weak var mainTableView: UITableView!
    
    var currentWindow = 1
    
    var camViews: [CameraView] = [
        CameraView(cameraView: "sunrise", icon: "", title: "Title", detail: ""),
        CameraView(cameraView: "sunrise", icon: "", title: "Title", detail: "")
    ]
    
    var doorWindow: [CameraView] = [
        CameraView(cameraView: "", icon: "lock", title: "Подъезд 1", detail: ""),
        CameraView(cameraView: "", icon: "lock", title: "Выход на пожарную лестницу", detail: ""),
        CameraView(cameraView: "", icon: "lock", title: "Подъезд 2", detail: ""),
        CameraView(cameraView: "sunrise", icon: "lock", title: "Домофон", detail: "В сети")
    ]

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if currentWindow == 1{
            return camViews.count
        }else{
            return doorWindow.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstTypeCell", for: indexPath) as! FirstTypeTableViewCell
        
        if currentWindow == 1{
            setCellStyle(cell, camViews, indexPath)
        }else if currentWindow == 2{
            setCellStyle(cell, doorWindow, indexPath)
        }
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    func setCellStyle(_ cell: FirstTypeTableViewCell, _ dataModel: [CameraView], _ indexPath: IndexPath){
        if !dataModel[indexPath.row].cameraView!.isEmpty{
            cell.imageCamera.image = UIImage(named: dataModel[indexPath.row].cameraView!)
        }else{
            cell.imageCamera.isHidden = true
        }
        
        if !dataModel[indexPath.row].icon!.isEmpty{
            cell.iconCamera.image = UIImage(named: dataModel[indexPath.row].icon!)
        }else{
            cell.iconCamera.isHidden = true
        }
        
        if !dataModel[indexPath.row].title!.isEmpty{
            cell.title.text = dataModel[indexPath.row].title
        }else{
            cell.title.isHidden = true
        }
        
        if !dataModel[indexPath.row].detail!.isEmpty{
            cell.detail.text = dataModel[indexPath.row].detail
        }else{
            cell.detail.isHidden = true
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    @IBAction func CamButtonAction(_ sender: Any) {
        currentWindow = 1
        mainCamerasTitle.isHidden = false
        changeCurrentWindow()
    }
    @IBAction func DoorButtonAction(_ sender: Any) {
        currentWindow = 2
        mainCamerasTitle.isHidden = true
        changeCurrentWindow()
    }
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        CameraButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
    }
    
    func changeCurrentWindow(){
        if (currentWindow == 1){
            CameraButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
            DoorsButton.removeBorder()
        }
            
        if (currentWindow == 2){
            DoorsButton.addBorder(side: .Bottom, color: UIColor.init(named: "borderColor")!, width: 2)
            CameraButton.removeBorder()
        }
        
        mainTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: nil) { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            print("edited")
        }
        
        let rate = UIContextualAction(style: .normal, title: nil) { (contextualAction, view, actionPerformed: (Bool) -> ()) in
            print("rated")
        }
        
        edit.image = UIImage(named: "edit")
        edit.backgroundColor = UIColor(named: "mainBG")
        
        rate.image = UIImage(named: "star")
        rate.backgroundColor = UIColor(named: "mainBG")
        
        if currentWindow == 1{
            return UISwipeActionsConfiguration(actions: [rate])
        }
        
        return UISwipeActionsConfiguration(actions: [rate,edit])
    }
    

}

