//
//  EventCell.swift
//  PASAN-PUNCHIHEWA-cobsccomp182p-033
//
//  Created by JOHN DOE on /3/320.
//  Copyright © 2020 PASAN. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var EVENTNAME: UILabel!
    @IBOutlet weak var EVENTDESCRIPTION: UILabel!
    @IBOutlet weak var EVENTDATE: UILabel!
    @IBOutlet weak var EVENTLOCATION: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
