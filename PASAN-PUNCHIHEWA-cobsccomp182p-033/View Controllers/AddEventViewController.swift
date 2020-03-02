//
//  AddEventViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /1/320.
//  Copyright © 2020 PASAN. All rights reserved.
//
import Foundation
import UIKit
import FirebaseDatabase



class AddEventViewController: UIViewController {
    @IBOutlet weak var EventInfotxt: UITextView!
    
    
    
    @IBAction func AddEventBtn(_ sender: Any) {
    }
    @IBAction func cancelBtn(_ sender: Any) {
    }
    
    @IBAction func EventNameTxt(_ sender: Any) {
    }
    
    @IBAction func EventSummerytxt(_ sender: Any) {
    }
    
    @IBAction func EventLocationTxt(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
       
        // Do any additional setup after loading the view.
    }
    
    @IBAction func AddEvent(_ sender: Any) {
        
       presentingViewController?.dismiss(animated: true, completion: nil)
        
//        if (txtFirstName.text == "") {
//            alert.showAlert(title: "Event", message: "First Name Required:",buttonText: "Add Missing Event")
//            return
//        }
//
//        if (txtLastName.text == ""){
//            alert.showAlert(title: "Event", message: "Lasr Name Required:",buttonText: "Add Missing Event")
//            return
//        }
//        if (txtContact.text == ""){
//            alert.showAlert(title: "Event", message: "Contact Required:",buttonText: "Add Missing Event")
//            return
//        }
//        if (txtDepartment.text == ""){
//            alert.showAlert(title: "Event", message: "Department Required:",buttonText: "Add Missing Event")
//            return
//        }
    }
    
    @IBAction func CancelEventClicked(_ sender: Any) {
        
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
