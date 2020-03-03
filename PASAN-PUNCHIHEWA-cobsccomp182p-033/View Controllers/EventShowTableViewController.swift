//
//  EventShowTableViewController.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /3/320.
//  Copyright © 2020 PASAN. All rights reserved.
//

import UIKit
import Foundation
import FirebaseAuth
import Firebase
import FirebaseFirestore

struct EventLoad {
    
    var EventName: String
    var EventDescriptionLbl: String
    var EventdateLbl: String
    var EventLocationLbl: String
    
}



class EventShowTableViewController: UITableViewController {
    
    var EventArr = [EventLoad]()
    {
        didSet
        {
             tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        GetEventsToCell()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return EventArr.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 400
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as!
//        EventViewCell
        
        let celle = tableView.dequeueReusableCell(withIdentifier: "EventCell") as!
        EventCell
        celle.EVENTNAME.text = EventArr[indexPath.row].EventName
        celle.EVENTDESCRIPTION.text = EventArr[indexPath.row].EventLocationLbl
        celle.EVENTDATE.text = EventArr[indexPath.row].EventdateLbl
        celle.EVENTLOCATION.text = EventArr[indexPath.row].EventLocationLbl
        
        
        
        return celle
    }
    
    func GetEventsToCell(){
        
        let db = Firestore.firestore()
        db.collection("Events").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    
                    
                    let EventPostName = document.data()["eventname"] as? String
                    
                    let EventPostDescription = document.data()["eventDescription"] as? String
                    
                    let EventDate = document.data()["eventdate"] as? String
                    
                    let EventLocation = document.data()["eventlocation"] as! String
                    
        
                    let EventDetailsFull = EventLoad(EventName: EventPostName!, EventDescriptionLbl: EventPostDescription!,  EventdateLbl: EventDate!, EventLocationLbl: EventLocation)
                    
                    self.EventArr.append(EventDetailsFull)
                    
                    print(EventDetailsFull)
                    
                    self.tableView.reloadData()
                    
                    
                }
            }
            
            
        }
        
        
    }
    

}
