//
//  People.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import Foundation

struct ContactList: Codable {
    var contacts = [Contact]()
}
struct Contact: Codable {
    let firstName: String!
    let avatar: String!
    let lastName, email, jobtitle, favouriteColor: String!
}
