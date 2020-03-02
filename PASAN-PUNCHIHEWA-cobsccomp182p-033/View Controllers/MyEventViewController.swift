//
//  MyEventViewController.swift
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


class MyEventViewController: UIViewController {
    @IBOutlet weak var SignOutBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func SignOutClicked(_ sender: Any) {
        
        do {
            try Auth.auth().signOut()
            let HomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeVC")
            
            self.present(HomeVC, animated: true,completion: nil)
            transitionToHome()
            
        } catch let err {
            print(err)
            
        }
    }
    func transitionToHome() {
        
        let homeViewController = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
        
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
