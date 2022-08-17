//
//  RoomTableViewCell.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import UIKit

class RoomTableViewCell: UITableViewCell {

    @IBOutlet weak var roomsAvailabilityLbl: UILabel!
    @IBOutlet weak var roomsOccupancyLbl: UILabel!
    @IBOutlet weak var roomsCreatedLbl: UILabel!
    
    public func configure(with roomsAvailability: Bool, roomOccupancy: Int, roomCreated: String){
        
        let availableText : String
        
        if roomsAvailability {
           availableText = "Available"
        }
        else{
            availableText = "Not Available"
        }
        
        let date = Date()
        let format = date.getFormattedDate(format: "yyyy-MM-dd HH:mm:ss")
        
        roomsAvailabilityLbl.text = "Room Availability : \(availableText)"
        roomsOccupancyLbl.text = "Room Occupancy : \(roomOccupancy)"
        roomsCreatedLbl.text = "Created on : \(format)"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension Date {
   func getFormattedDate(format: String) -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
