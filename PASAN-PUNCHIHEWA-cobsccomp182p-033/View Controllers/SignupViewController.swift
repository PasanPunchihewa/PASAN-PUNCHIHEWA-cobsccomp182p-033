//
//  SignupViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /28/220.
//  Copyright © 2020 PASAN. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore


class SignupViewController: UIViewController {
    @IBOutlet weak var FirstNameTxt: UITextField!
    @IBOutlet weak var LastNameTxt: UITextField!
    @IBOutlet weak var EmailAddressTxt: UITextField!
    @IBOutlet weak var PasswordTxt: UITextField!
    @IBOutlet weak var SignupBtn: UIButton!
    @IBOutlet weak var ErrorLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupElements()
    }
    
    func setupElements() {
        ErrorLbl.alpha = 0
        
        Utilities.styleTextField(FirstNameTxt)
        Utilities.styleTextField(LastNameTxt)
        Utilities.styleTextField(EmailAddressTxt)
        Utilities.styleTextField(PasswordTxt)
        Utilities.styleFilledButton(SignupBtn)
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    //chevk the fiels
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if FirstNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            LastNameTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            EmailAddressTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            PasswordTxt.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
        }
        
        // Check if the password is secure
        let cleanedPassword = PasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        
        
        return nil
    }
    
    @IBAction func SignupClicked(_ sender: Any) {
        
        // Validate the fields
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            showError(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = FirstNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = LastNameTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = EmailAddressTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = PasswordTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    self.showError("Error creating user")
                }
                else {
                    
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("users").addDocument(data: ["firstname":firstName, "lastname":lastName, "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            self.showError("Error saving user data")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
            }
            
            
            
        }
    }
    func showError(_ message:String) {
        
        ErrorLbl.text = message
        ErrorLbl.alpha = 1
    }
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
    }
    
}
