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
//    class UiEventHomeViewController: UIViewController{
//        var eventList : [Event] = []
//        var ref: DatabaseReference!
//        var window: UIWindow?
//        @IBOutlet weak var tableView: UITableView!
//
//        var refEvents: DatabaseReference!
//
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            ref = Database.database().reference()
//
//            tableView.dataSource = self
//            tableView.delegate = self
//            getEventDetails()
//
//        }
//
//        func getEventDetails(){
//            let eventsRef = ref.child("events")
//
//            eventsRef.observe(.value){ snapshot in
//                for child in snapshot.children.allObjects as! [DataSnapshot] {
//
//                    let ObjectDic = child.value as! NSDictionary
//
//                    let event_title = ObjectDic["event_title"] as! String
//                    let description = ObjectDic["description"] as! String
//                    let location = ObjectDic["location"] as! String
//                    let imageUrl = ObjectDic["imageUrl"] as! String
//                    let summery = ObjectDic["summery"] as! String
//                    let post = Event(
//                        event_title: event_title,
//                        description: description,
//                        summery: summery,
//                        location: location,
//
//                        imageUrl: imageUrl
//                    )
//
//                    self.eventList.append(post)
//
//                    print(child)
//                }
//
//                self.tableView.reloadData()
//
//
//            }
//
//        }
//
//    }
//
//    extension UiEventHomeViewController: UITableViewDataSource, UITableViewDelegate{
//
//        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//            return eventList.count
//        }
//
//        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//
//            let eventCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EventsTableViewCell
//
//            eventCell.selectionStyle = .none
//
//            eventCell.getData(post: eventList[indexPath.row])
//
//            return eventCell
//        }
//        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 300
//        }
//
//        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//            performSegue(withIdentifier: "eventView", sender: eventList[indexPath.row])
//        }
//
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "eventView" {
//                if let viewController = segue.destination as? UiPostsViewController{
//
//                    viewController.posts = sender as? Event
//                }
//            }
//        }
//    }
    
    
    
    
    

    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
