//
//  Parser.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import UIKit

struct PeopleDataParser {
    
    func parse(comple : @escaping ([Contact])->()) {
        let api = URL(string: Constants.peopleURL)
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print (error?.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode([Contact].self, from: data!)
                comple(result)
                
              //  cont = result
            } catch {
                
            }
            
            }.resume()
        }
}

struct RoomDataParser {
    
    func parse(comple : @escaping ([Room])->()) {
        let api = URL(string: Constants.roomsURL)
        
        URLSession.shared.dataTask(with: api!) {
            data, response, error in
            if error != nil {
                print (error?.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()

            do {
                let result = try decoder.decode([Room].self, from: data!)
                comple(result)
                
              //  cont = result
            } catch {
                
            }
            
            }.resume()
        }
}
