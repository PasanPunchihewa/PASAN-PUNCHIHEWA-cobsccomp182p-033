//
//  ResetPasswordViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /2/320.
//  Copyright © 2020 PASAN. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore


class ResetPasswordViewController: UIViewController {
    @IBOutlet weak var ResetLbl: UILabel!
    
    @IBOutlet weak var ResetBtn: UIButton!
    @IBOutlet weak var ResetTxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupElements()
        ResetLbl.alpha = 0
        
        
        // Do any additional setup after loading the view.
    }
    func setupElements() {
        
        Utilities.styleFilledButton(ResetBtn)
        Utilities.styleTextField(ResetTxt)
        
    }
    
    @IBAction func ResetClicked(_ sender: Any) {
        
        let passwordresetEmailText = ResetTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let pswerrorMessage = validateTextFields()
        if pswerrorMessage != nil{
            showErrorMessage(pswerrorMessage!)
        } else{
            
            resetPassword(email: passwordresetEmailText, onSuccess: {
                self.view.endEditing(true)
                self.navigationController?.popViewController(animated: true)
            }) { (pswerrorMessage) in
                self.showErrorMessage(pswerrorMessage)
            }
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    func showErrorMessage(_ pswerrorMessage:String){
        ResetLbl.text = pswerrorMessage
        ResetLbl.alpha = 1
    }
    
    func validateTextFields() -> String? {
        if ResetTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return "Please enter an email address for password reset"
        }
        
        let resetEmailValid = ResetTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        return nil
        
    }
    
    func resetPassword(email: String, onSuccess: @escaping() -> Void, onError: @escaping(_ _errorMessahe: String) -> Void){
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if error == nil{
                onSuccess()
            }else{
                onError(error!.localizedDescription)
            }
        }
        
    }
    
}
