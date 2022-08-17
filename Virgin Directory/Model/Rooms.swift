//
//  Rooms.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import Foundation

struct RoomsList: Codable {
    var rooms = [Room]()
}

struct Room: Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
}
