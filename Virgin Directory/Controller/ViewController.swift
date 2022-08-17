//
//  ViewController.swift
//  Virgin Directory
//
//  Created by pradeep reddy kumbam on 14/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var directoryTableView: UITableView!
    var peopleParser = PeopleDataParser()
    var roomParser = RoomDataParser()

    var peopleContactsData = [Contact]()
    var roomsData = [Room]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        segmentedControl.selectedSegmentIndex = 0
        directoryTableView.register(UINib(nibName: Constants.peoplesTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.peoplesTableViewCellIdentifier)

        if segmentedControl.selectedSegmentIndex == 0 {
            peopleParser.parse { (data) in
                
                print(data)
                self.peopleContactsData = data
                
                DispatchQueue.main.async {
                    self.directoryTableView.reloadData()
                }
            }
            
        }else{
            roomParser.parse { (data) in
                
                print(data)
                self.roomsData = data
                
                DispatchQueue.main.async {
                    self.directoryTableView.reloadData()
                }
            }
            
        }

        
    }
    @IBAction func segmentIndexChanged(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            directoryTableView.register(UINib(nibName: Constants.peoplesTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.peoplesTableViewCellIdentifier)
            
            peopleParser.parse { (data) in
                
                print(data)
                self.peopleContactsData = data
                
                DispatchQueue.main.async {
                    self.directoryTableView.reloadData()
                }
            }
            

        case 1:
            directoryTableView.register(UINib(nibName: Constants.roomTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constants.roomTableViewCellIdentifier)
            
                roomParser.parse { (data) in
                    
                    print(data)
                    self.roomsData = data
                    
                    DispatchQueue.main.async {
                        self.directoryTableView.reloadData()
                    }
                }
                
        default:
            break
        }

    }
    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            return peopleContactsData.count
        }else{
            return roomsData.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if segmentedControl.selectedSegmentIndex == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.peoplesTableViewCellIdentifier, for: indexPath) as! PeoplesTableViewCell
                    
            cell.configure(with: peopleContactsData[indexPath.row].avatar, name: "\(peopleContactsData[indexPath.row].firstName + peopleContactsData[indexPath.row].lastName) ", designation: peopleContactsData[indexPath.row].jobtitle, email: peopleContactsData[indexPath.row].email, color: peopleContactsData[indexPath.row].favouriteColor)
            

            return cell
        }else{

            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.roomTableViewCellIdentifier, for: indexPath) as! RoomTableViewCell


            cell.configure(with: roomsData[indexPath.row].isOccupied, roomOccupancy: roomsData[indexPath.row].maxOccupancy, roomCreated: roomsData[indexPath.row].createdAt)

            return cell

        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if segmentedControl.selectedSegmentIndex == 0 {
                                
            let text = "\(peopleContactsData[indexPath.row].firstName! + peopleContactsData[indexPath.row].lastName!) , \(peopleContactsData[indexPath.row].jobtitle!) , \(peopleContactsData[indexPath.row].email!) , \(peopleContactsData[indexPath.row].favouriteColor!))"
                        
            let shareAll = [text]
                let activityViewController = UIActivityViewController(activityItems: shareAll, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view
                self.present(activityViewController, animated: true, completion: nil)


        }else{
            
        }
    }
    
}
