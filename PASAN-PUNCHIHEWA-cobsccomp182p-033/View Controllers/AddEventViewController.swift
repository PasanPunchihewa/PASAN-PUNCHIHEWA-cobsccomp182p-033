//
//  AddEventViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /2/320.
//  Copyright © 2020 PASAN. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

class AddEventViewController: UIViewController {
    @IBOutlet weak var EventNameTxt: UITextField!
    @IBOutlet weak var EventDiscriptinTxt: UITextView!
    
    @IBOutlet weak var EventLocationTxt: UITextField!
    @IBOutlet weak var EventDateTxt: UITextField!
    @IBOutlet weak var EventSubmitBtn: UIButton!
    @IBOutlet weak var EventClearBtn: UIButton!
    @IBOutlet weak var StatusLbl: UILabel!
    @IBOutlet weak var UserIDTxt: UITextField!
    @IBOutlet weak var EvenDescriptiontxt2: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        UserIDTxt.isUserInteractionEnabled = false
       
        
        
        setUpElements()

        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){
         StatusLbl.alpha = 0

        
        
        
        Utilities.styleFilledButton(EventClearBtn)
        Utilities.styleFilledButton(EventSubmitBtn)
        
    }
    
    @IBAction func EventSubmitBtnClicked(_ sender: Any) {
        
        
        if EventNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventDiscriptinTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventDateTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EventLocationTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            self.StatusLbl.text = "Plese fill the form"
            self.StatusLbl.alpha = 1
            self.ClearFields()
            
        }
        else
        {
        let eventName = EventNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventDate = EventDateTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventDescription = EvenDescriptiontxt2.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let eventLocation =  EventLocationTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let ownerID =  UserIDTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        let database = Firestore.firestore()
        
        database.collection("Events").document(eventName).setData(["eventname":eventName , "eventdate": eventDate , "eventDescription": eventDescription, "eventlocation": eventLocation, "ownerID" : ownerID ]) { (error) in
            
            
            if error != nil {
                
                self.showError("Error when creating Event")
            }else{
                
                self.StatusLbl.text = "Data Saved"
                self.StatusLbl.alpha = 1
               self.ClearFields()
                
                
                //                self.redirectToHomeController()
            }
            
            
            
        }
    }
    }
    @IBAction func EventClearClicked(_ sender: Any) {
        
        ClearFields()
        
        
    }
    func ClearFields() {
        
       
        EventNameTxt.text = ""
        EventDateTxt.text = ""
        EventLocationTxt.text = ""
        EvenDescriptiontxt2.text = ""
        
    }
    
    
    func showError(_ message:String) {
        
        StatusLbl.text = message
        StatusLbl.alpha = 1
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
