//
//  SigninViewController.swift
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


class SigninViewController: UIViewController {
    @IBOutlet weak var EmailAddressTxt: UITextField!
    @IBOutlet weak var Passwordtxt: UITextField!
    @IBOutlet weak var LoginBtn: UIButton!
    @IBOutlet weak var ErrorLbl: UILabel!
    @IBOutlet weak var ForgotPasswordBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        setUpElements()
    }
    func setUpElements(){
        
        ErrorLbl.alpha = 0
        
        Utilities.styleTextField(EmailAddressTxt)
        Utilities.styleTextField(Passwordtxt)
        
        Utilities.styleFilledButton(LoginBtn)
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func LoginClicked(_ sender: Any) {
        
        // TODO: Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = EmailAddressTxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = Passwordtxt.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                self.ErrorLbl.text = error!.localizedDescription
                self.ErrorLbl.alpha = 1
            }
            else {
                
                let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
                
                self.view.window?.rootViewController = homeViewController
                self.view.window?.makeKeyAndVisible()
            }
        }
    }
    
    @IBAction func ForgotPasswordClicked(_ sender: Any) {
    }
    
}
