//
//  EventShow.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /3/320.
//  Copyright © 2020 PASAN. All rights reserved.
//


import Foundation
import  UIKit

class EventShow {
    
    var EventName: String
    var EventDescriptionLbl: String
    var EventdateLbl: String
    var EventLocationLbl: String
    
    
    
    init( EventName:String , EventDescriptionLbl:String , EventdateLbl:String , EventLocationLbl:String ) {
        
        self.EventName = EventName
        self.EventDescriptionLbl = EventDescriptionLbl
        self.EventdateLbl = EventdateLbl
        self.EventLocationLbl = EventLocationLbl
     
        
        
    }
}
